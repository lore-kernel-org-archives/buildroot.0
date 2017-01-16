From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:45:00 +0100
Subject: [Buildroot] [git commit] snmppp: bump to 3.3.8
Message-ID: <20170116124621.2E8C77FB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8095343f015fce50c3d9a47c51d56b0b91326c10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch not needed anymore: the bug has been fixed in this release.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/0001-Add-missing-includes.patch | 41 --------------------------
 package/snmppp/snmppp.hash                     |  2 +-
 package/snmppp/snmppp.mk                       |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/package/snmppp/0001-Add-missing-includes.patch b/package/snmppp/0001-Add-missing-includes.patch
deleted file mode 100644
index c3fa491..0000000
--- a/package/snmppp/0001-Add-missing-includes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6433c6e8d81313ec7ef6c8d3abf96fffa537e23e Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Tue, 1 Apr 2014 14:35:25 +0200
-Subject: [PATCH] Add missing includes
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
----
- include/snmp_pp/config_snmp_pp.h.in | 4 ++++
- include/snmp_pp/smival.h            | 1 +
- 2 files changed, 5 insertions(+)
-
-diff --git a/include/snmp_pp/config_snmp_pp.h.in b/include/snmp_pp/config_snmp_pp.h.in
-index 89a5b0d..3100713 100644
---- a/include/snmp_pp/config_snmp_pp.h.in
-+++ b/include/snmp_pp/config_snmp_pp.h.in
-@@ -28,6 +28,10 @@
- #ifndef _CONFIG_SNMP_PP_H_
- #define _CONFIG_SNMP_PP_H_
- 
-+#ifdef __linux__
-+#include <sys/socket.h>
-+#endif
-+
- #define SNMP_PP_VERSION_STRING "@VERSION@"
- #define SNMP_PP_VERSION @SNMP_PP_MAJOR_VERSION@
- #define SNMP_PP_RELEASE @SNMP_PP_MINOR_VERSION@
-diff --git a/include/snmp_pp/smival.h b/include/snmp_pp/smival.h
-index 7a36fab..7522087 100644
---- a/include/snmp_pp/smival.h
-+++ b/include/snmp_pp/smival.h
-@@ -59,6 +59,7 @@
- #define _SMIVALUE
- 
- //----[ includes ]-----------------------------------------------------
-+#include <string.h>
- #include "snmp_pp/smi.h"
- 
- #ifdef SNMP_PP_NAMESPACE
--- 
-1.8.3.2
-
diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 462f413..2c97a48 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 2ef82819f2c4e9fec4c054a3e78a6d66f9927e306ea61d3a7aa6fe1218663da8  snmp++-3.3.7.tar.gz
+sha256 982b5f03436813b3094ace49ba5ececc595f9b6db1ad90bd8bf8494e39aa438f  snmp++-3.3.8.tar.gz
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 69ec925..1419514 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.7
+SNMPPP_VERSION = 3.3.8
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
