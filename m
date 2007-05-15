From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 15 May 2007 02:34:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070515093400.7808C48013@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-15 02:33:57 -0700 (Tue, 15 May 2007)
New Revision: 18619

Log:
- fixed upstream in r18618


Removed:
   trunk/buildroot/package/busybox/busybox.network-odd-dependencies.patch


Changeset:
Deleted: trunk/buildroot/package/busybox/busybox.network-odd-dependencies.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox.network-odd-dependencies.patch	2007-05-15 09:33:32 UTC (rev 18618)
+++ trunk/buildroot/package/busybox/busybox.network-odd-dependencies.patch	2007-05-15 09:33:57 UTC (rev 18619)
@@ -1,59 +0,0 @@
-Index: busybox/networking/libiproute/Kbuild
-===================================================================
---- busybox/networking/libiproute/Kbuild	(revision 17720)
-+++ busybox/networking/libiproute/Kbuild	(working copy)
-@@ -8,11 +8,6 @@
- lib-y:=
- lib-$(CONFIG_IP) += \
- 	ip_parse_common_args.o \
--	ipaddress.o \
--	iplink.o \
--	iproute.o \
--	iptunnel.o \
--	iprule.o \
- 	libnetlink.o \
- 	ll_addr.o \
- 	ll_map.o \
-@@ -22,7 +17,7 @@
- 	rtm_map.o \
- 	utils.o
- 
--lib-$(CONFIG_IPADDR) += \
-+lib-$(CONFIG_FEATURE_IP_ADDRESS) += \
- 	ip_parse_common_args.o \
- 	ipaddress.o \
- 	libnetlink.o \
-@@ -32,7 +27,7 @@
- 	rt_names.o \
- 	utils.o
- 
--lib-$(CONFIG_IPLINK) += \
-+lib-$(CONFIG_FEATURE_IP_LINK) += \
- 	ip_parse_common_args.o \
- 	ipaddress.o \
- 	iplink.o \
-@@ -43,7 +38,7 @@
- 	rt_names.o \
- 	utils.o
- 
--lib-$(CONFIG_IPROUTE) += \
-+lib-$(CONFIG_FEATURE_IP_ROUTE) += \
- 	ip_parse_common_args.o \
- 	iproute.o \
- 	libnetlink.o \
-@@ -52,13 +47,13 @@
- 	rtm_map.o \
- 	utils.o
- 
--lib-$(CONFIG_IPTUNNEL) += \
-+lib-$(CONFIG_FEATURE_IP_TUNNEL) += \
- 	ip_parse_common_args.o \
- 	iptunnel.o \
- 	rt_names.o \
- 	utils.o
- 
--lib-$(CONFIG_IPRULE) += \
-+lib-$(CONFIG_FEATURE_IP_RULE) += \
- 	ip_parse_common_args.o \
- 	iprule.o \
- 	rt_names.o \
