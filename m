From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 16:45:38 +0100
Subject: [Buildroot] [git commit branch/next] lxc: enable selinux if package
	is selected
Message-ID: <20170211154542.EE0BE81E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25707b2fd63abbf93417d7d878c29d7585914ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
