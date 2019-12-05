From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  5 Dec 2019 12:53:21 -0800
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 244
Message-ID: <20191205205321.2489258-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Update hash for README due to added licence directory tools/chromiumos.
  - Add hash for tools/chromiumos/LICENSE
  - Added BSD-Style in systemd.mk due to the new tools/chromiumos directory.
  - Added tools/chromiumos/LICENSE to SYSTEMD_LICENSE_FILES in systemd.mk

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/systemd/0001-install-don-t-use-ln-relative.patch | 2 +-
 package/systemd/systemd.hash                             | 5 +++--
 package/systemd/systemd.mk                               | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/systemd/0001-install-don-t-use-ln-relative.patch b/package/systemd/0001-install-don-t-use-ln-relative.patch
index 2bde36c774..9201724da1 100644
--- a/package/systemd/0001-install-don-t-use-ln-relative.patch
+++ b/package/systemd/0001-install-don-t-use-ln-relative.patch
@@ -33,7 +33,7 @@ diff --git a/meson.build b/meson.build
 index e5ceb1e169..9d3c746da4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -580,7 +580,7 @@ endforeach
+@@ -591,7 +591,7 @@ endforeach
  conf.set_quoted('TELINIT', get_option('telinit-path'))
  
  if run_command('ln', '--relative', '--help').returncode() != 0
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 584198d14b..7f5e561ca3 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,6 @@
 # sha256 locally computed
-sha256	281bc47aa6b173c3c6fa1bbc88aea84ecb014313aeb679c54f8885dd09e434be	systemd-243.4.tar.gz
+sha256	8de7b4880599777768851560916b35d55c8db8d6791edaf80e2c4666331db2f6	systemd-244.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
-sha256	ff5a9e3791e3a941a2d85b5ef7ad7c01441dd42f4c760bff2c8b086c7d764885	README
+sha256	ca008b0178b6390e874f6e4a890fbed482b0fb946159a3b1d370bd8d2327d9bc	README
+sha256	83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275	tools/chromiumos/LICENSE
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ebec9bdd91..d41550a22c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 243.4
+SYSTEMD_VERSION = 244
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
-SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
-SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
+SYSTEMD_LICENSE = BSD-Style LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
+SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
-- 
2.23.0
