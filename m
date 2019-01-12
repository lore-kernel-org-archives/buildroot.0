From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jan 2019 22:08:43 +0100
Subject: [Buildroot] [PATCH 1/2] lxc: add optional dependency to
 bash-completion
Message-ID: <20190112210844.4021-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lxc uses the completionsdir variable from bash-completions.pc to decide
where to install things.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index c9838fb229..c758a15b9d 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -17,6 +17,10 @@ LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LXC_DEPENDENCIES += bash-completion
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LXC_CONF_OPTS += --enable-gnutls
 LXC_DEPENDENCIES += gnutls
-- 
2.14.1
