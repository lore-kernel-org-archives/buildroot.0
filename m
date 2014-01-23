From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jan 2014 12:46:14 +0100
Subject: [Buildroot] [git commit] busybox 1.22.1: add upstream iplink fix
Message-ID: <20140123114929.CA6209C5F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1052a4a75f610ddcfb73f6d3aba8472f5b0cd2ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../1.22.1/0004-busybox-1.22.1-iplink.patch        |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

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
