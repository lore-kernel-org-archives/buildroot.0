From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:28:03 +0100
Subject: [Buildroot] [git commit] f2fs-tools: bump to version v1.2.0
Message-ID: <20131211213619.9A9949BFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae338288ff025ea4386a88abf54a3d6a03979160
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Adds staging installation for libf2fs
* Adds fsck.f2fs
* Fix license variables names

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/f2fs-tools/f2fs-tools.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

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
