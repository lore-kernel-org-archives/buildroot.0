From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 22:06:42 +0100
Subject: [Buildroot] [git commit] package/drbd-utils: bump to version 9.15
Message-ID: <20201026205426.7592781841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfcf76b955d2b4f24445d7d658fee3a31df4b94b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/LINBIT/drbd-utils/blob/v9.15.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Make-setup_options-definitions-as-extern.patch | 31 ----------------------
 package/drbd-utils/drbd-utils.hash                 |  2 +-
 package/drbd-utils/drbd-utils.mk                   |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch b/package/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
deleted file mode 100644
index 3a7e32950e..0000000000
--- a/package/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a513dea1cf000164fd87e56525d098a426131a86 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Aug 2020 12:59:38 -0700
-Subject: [PATCH] v84: Make setup_options definitions as extern
-
-This is already defined in drbdadm_main.c, therefore make this
-declaration to be extern for other modules
-
-Fixes compatibility with gcc-10 which uses -fno-common by default
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Retrieved from:
-https://github.com/LINBIT/drbd-utils/commit/a513dea1cf000164fd87e56525d098a426131a86]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- user/v84/drbdadm.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/user/v84/drbdadm.h b/user/v84/drbdadm.h
-index ed63d78c..8469f1c4 100644
---- a/user/v84/drbdadm.h
-+++ b/user/v84/drbdadm.h
-@@ -251,7 +251,7 @@ struct setup_option {
- 	bool explicit;
- 	char *option;
- };
--struct setup_option *setup_options;
-+extern struct setup_option *setup_options;
- 
- extern void add_setup_option(bool explicit, char *option);
- 
diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index 79914af508..47f6f6ecf5 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  16a6d000aac7f746419839a2c2afcb71fa8779fe0b5898e967767791cb8f4bc7  drbd-utils-9.12.0.tar.gz
+sha256  e89be59e60fc33534481a5dcae90de242e35867512d85cef2878ca757bfb074a  drbd-utils-9.15.0.tar.gz
 sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index a24cc4ade6..8ea581eb27 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.12.0
+DRBD_UTILS_VERSION = 9.15.0
 DRBD_UTILS_SITE = http://www.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
