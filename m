From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 23:24:59 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/samba4: security
	bump to version 4.5.14
Message-ID: <20170921211807.D9E1E80279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f4d4ae57e3b431e8ece83d698e1326e5d8af6f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Release notes:
https://www.samba.org/samba/history/samba-4.5.14.html

Fixes
- CVE-2017-12150 (SMB1/2/3 connections may not require signing where
  they should)
- CVE-2017-12151 (SMB3 connections don't keep encryption across DFS
  redirects)
- CVE-2017-12163 (Server memory information leak over SMB1)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 0d8b111..847be87 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5fc4762d2259469bfb0067c10f77378cb720f2ebdaf2f37b5ca1918dbe84d04d samba-4.5.13.tar.gz
+sha256  15dc04fd2b19081daf1118318f43f88ef7260b3fc6e4f86ee7c7913bb7c92ed9 samba-4.5.14.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 08fa400..e4778d0 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.13
+SAMBA4_VERSION = 4.5.14
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
