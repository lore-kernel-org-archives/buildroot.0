From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Feb 2017 17:17:10 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: enable selinux if package is selected
Message-ID: <1486743430-68233-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabrice Fontaine <fabrice.fontaine@orange.com>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 455814b..b79197f 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -29,6 +29,13 @@ else
 LXC_CONF_OPTS += --disable-seccomp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LXC_CONF_OPTS += --enable-selinux
+LXC_DEPENDENCIES += libselinux
+else
+LXC_CONF_OPTS += --disable-selinux
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
 LXC_CONF_OPTS += --enable-lua
 LXC_DEPENDENCIES += luainterpreter
-- 
2.5.0
