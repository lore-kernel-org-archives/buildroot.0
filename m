From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 03 Aug 2011 11:18:19 +0200
Subject: [Buildroot] [PATCH] openvpn: bump to 2.2.1
Message-ID: <4E39125B.6050302@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tmpdir issue was already fixed in 2.2.1 version, so
remove the patch

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/openvpn/openvpn-fix-tmpdir.patch |   39 -------------------------------
 package/openvpn/openvpn.mk               |    2 -
 2 files changed, 1 insertion(+), 40 deletions(-)

Index: b/package/openvpn/openvpn.mk
===================================================================
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.2.0
+OPENVPN_VERSION = 2.2.1
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_CONF_OPT = --enable-small --disable-plugins
 
Index: b/package/openvpn/openvpn-fix-tmpdir.patch
===================================================================
--- a/package/openvpn/openvpn-fix-tmpdir.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b70d99fb617350b252c8bde2f1f2d81d3f5b7955 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 27 Apr 2011 18:43:50 +0200
-Subject: [PATCH] Fix compile issues when using --enable-small and --disable-ssl/--disable-crypto
-
-The tmp_dir string is required in the options struct regardless of options
-so spin it out of #if conditionals.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Acked-by: David Sommerseth <dazo@users.sourceforge.net>
-Signed-off-by: David Sommerseth <dazo@users.sourceforge.net>
----
- options.h |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/options.h b/options.h
-index a9c6a94..8a51502 100644
---- a/options.h
-+++ b/options.h
-@@ -369,6 +369,8 @@ struct options
-   struct plugin_option_list *plugin_list;
- #endif
- 
-+  const char *tmp_dir;
-+
- #if P2MP
- 
- #if P2MP_SERVER
-@@ -409,7 +411,6 @@ struct options
-   const char *client_connect_script;
-   const char *client_disconnect_script;
-   const char *learn_address_script;
--  const char *tmp_dir;
-   const char *client_config_dir;
-   bool ccd_exclusive;
-   bool disable;
--- 
-1.7.0.1
-
