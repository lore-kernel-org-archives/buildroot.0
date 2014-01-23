From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Jan 2014 07:21:15 -0300
Subject: [Buildroot] [PATCH] busybox 1.22.1: add upstream iplink fix
Message-ID: <1390472475-26328-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../busybox/1.22.1/0004-busybox-1.22.1-iplink.patch   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/busybox/1.22.1/0004-busybox-1.22.1-iplink.patch

diff --git a/package/busybox/1.22.1/0004-busybox-1.22.1-iplink.patch b/package/busybox/1.22.1/0004-busybox-1.22.1-iplink.patch
new file mode 100644
index 0000000..dbd76c5
--- /dev/null
+++ b/package/busybox/1.22.1/0004-busybox-1.22.1-iplink.patch
@@ -0,0 +1,19 @@
+--- busybox-1.22.1/networking/libiproute/iplink.c
++++ busybox-1.22.1-iplink/networking/libiproute/iplink.c
+@@ -31,6 +31,16 @@
+ #ifndef IFLA_LINKINFO
+ # define IFLA_LINKINFO 18
+ # define IFLA_INFO_KIND 1
++# define IFLA_INFO_DATA 2
++#endif
++
++#ifndef IFLA_VLAN_MAX
++# define IFLA_VLAN_ID 1
++# define IFLA_VLAN_FLAGS 2
++struct ifla_vlan_flags {
++	uint32_t	flags;
++	uint32_t	mask;
++};
+ #endif
+ 
+ /* taken from linux/sockios.h */
-- 
1.8.3.2
