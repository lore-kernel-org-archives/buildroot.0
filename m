From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Jul 2020 19:48:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/lxc: disable examples
Message-ID: <20200714174851.1399083-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 53e3c85c6d..7994dffcf5 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -13,7 +13,10 @@ LXC_INSTALL_STAGING = YES
 # We're patching configure.ac
 LXC_AUTORECONF = YES
 
-LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
+LXC_CONF_OPTS = \
+	--disable-apparmor \
+	--disable-examples \
+	--with-distro=buildroot \
 	--disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
-- 
2.27.0
