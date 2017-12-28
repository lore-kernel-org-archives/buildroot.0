From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 10:06:45 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: drop 2012.08 entries
Message-ID: <20171228090718.2FFE8837B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46f96a7d9ebdf46cfe495f9fde05e7f6c4d7f47b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those entries are older than 5 years, we can drop them now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index decbace..47b4956 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3166,41 +3166,6 @@ config BR2_PACKAGE_PTHREAD_STUBS
 	  For consistency reason, the pthread-stubs package has been
 	  renamed to libpthread-stubs.
 
-###############################################################################
-comment "Legacy options removed in 2012.08"
-
-config BR2_PACKAGE_GETTEXT_STATIC
-	bool "libgettext.a is now selected by BR2_PREFER_STATIC_LIB"
-	select BR2_LEGACY
-	help
-	  To build a static gettext library, select BR2_PREFER_STATIC_LIB.
-
-
-config BR2_PACKAGE_LIBINTL
-	bool "libintl"
-	select BR2_LEGACY
-	select BR2_PACKAGE_GETTEXT
-	help
-	  libintl is now installed by selecting BR2_PACKAGE_GETTEXT. This now
-	  only installs the library, not the executables.
-
-config BR2_PACKAGE_INPUT_TOOLS_EVTEST
-	bool "input-tools evtest is now a separate package evtest"
-	select BR2_LEGACY
-	select BR2_PACKAGE_EVTEST
-	help
-	  The evtest program from input-tools is now a separate package.
-
-config BR2_BFIN_FDPIC
-	bool "BR2_BFIN_FDPIC is now BR2_BINFMT_FDPIC"
-	select BR2_BINFMT_FDPIC
-	select BR2_LEGACY
-
-config BR2_BFIN_FLAT
-	bool "BR2_BFIN_FLAT is now BR2_BINFMT_FLAT"
-	select BR2_BINFMT_FLAT
-	select BR2_LEGACY
-
 endmenu
 
 endif # !SKIP_LEGACY
