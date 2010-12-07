From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Dec 2010 12:25:46 +0100
Subject: [Buildroot] [git commit master 1/1] package/openssh: Use HTTP
	instead of FTP for source download
Message-ID: <20101207112701.115368D35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=56a2e82c40947bb4eab2a129bfe184df83fd2807
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HTTP should be more firewall friendly.

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/openssh/openssh.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7ca867f..b3cf6ae 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2011.02, Not yet released:
 
-	Updated/fixed packages: cloop, m4, xz
+	Updated/fixed packages: cloop, m4, openssh, xz
 
 2010.11, Released November 30th, 2010:
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 236a3a8..82c64d6 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 OPENSSH_VERSION = 5.6p1
-OPENSSH_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
+OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
-- 
1.7.2.2
