From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 09:11:24 -0600
Subject: [Buildroot] [PATCH v4 23/27] vim: selinux support
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420816288-8750-24-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/vim/vim.mk | 7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
1.9.1
