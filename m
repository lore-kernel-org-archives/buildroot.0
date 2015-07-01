From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jul 2015 10:19:11 +0200
Subject: [Buildroot] [git commit] vim: selinux support
Message-ID: <20150701085622.9AB2D817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdc18ae10c0a026946a02a5cd6dad307baac285a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vim/vim.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index da84d14..518afaf 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -28,6 +28,13 @@ VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
 VIM_LICENSE = Charityware
 VIM_LICENSE_FILES = README.txt
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+VIM_CONF_OPTS += --enable-selinux
+VIM_DEPENDENCIES += libselinux
+else
+VIM_CONF_OPTS += --disable-selinux
+endif
+
 define VIM_INSTALL_TARGET_CMDS
 	cd $(@D)/src; \
 		$(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
