From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 13:37:02 -0300
Subject: [Buildroot] [PATCH] f2fs-tools: bump to version v1.2.0
Message-ID: <1386779822-2283-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Adds staging installation for libf2fs
* Adds fsck.f2fs
* Fix license variables names

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/f2fs-tools/f2fs-tools.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index d8186a1..cffd4cb 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = fef98ebdf3a7728017cb3d0ae4ffedc5405e531d
+F2FS_TOOLS_VERSION = 576cb469e73b9342f1d10ba5d0428bbce22cbc3b
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
 # GIT version, shipped without configure
 F2FS_TOOLS_AUTORECONF = YES
-F2FS_LICENSE = GPLv2
-F2FS_LICENSE_FILES = COPYING
+F2FS_TOOLS_INSTALL_STAGING = YES
+F2FS_TOOLS_LICENSE = GPLv2
+F2FS_TOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.3.2
