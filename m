From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Mar 2016 22:33:23 +0100
Subject: [Buildroot] [git commit] samba4: security bump to version 4.3.6
Message-ID: <20160308213340.F18AC800FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52be26e90c08caf78617deb4f1af6746af0f5b95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-7560 - Authenticated client could cause Samba to overwrite ACLs
with incorrect owner/group.
CVE-2016-0771 - Malicious request can cause the Samba internal DNS
server to crash or unintentionally return uninitialized memory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 1b53657..d8458e6 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	583f927a823b272757fd4df0be267bd20a223b06cfc3c662df17e4870f14bf1c	samba-4.3.5.tar.gz
+sha256	3251eca5b196854e79978f4a92d5fd2b55bd7b0a252a65131a9be02be6754924	samba-4.3.6.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 715983e..ee0452e 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.3.5
+SAMBA4_VERSION = 4.3.6
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
