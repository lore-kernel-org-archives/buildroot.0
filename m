From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 Apr 2014 00:20:02 +0200
Subject: [Buildroot] [PATCH 1/5] snmppp: fix missing includes
In-Reply-To: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
References: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1396822806-32655-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 .../snmppp/snmppp-01-Add-missing-includes.patch    | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/snmppp/snmppp-01-Add-missing-includes.patch

diff --git a/package/snmppp/snmppp-01-Add-missing-includes.patch b/package/snmppp/snmppp-01-Add-missing-includes.patch
new file mode 100644
index 0000000..c3fa491
--- /dev/null
+++ b/package/snmppp/snmppp-01-Add-missing-includes.patch
@@ -0,0 +1,41 @@
+From 6433c6e8d81313ec7ef6c8d3abf96fffa537e23e Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Tue, 1 Apr 2014 14:35:25 +0200
+Subject: [PATCH] Add missing includes
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ include/snmp_pp/config_snmp_pp.h.in | 4 ++++
+ include/snmp_pp/smival.h            | 1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/include/snmp_pp/config_snmp_pp.h.in b/include/snmp_pp/config_snmp_pp.h.in
+index 89a5b0d..3100713 100644
+--- a/include/snmp_pp/config_snmp_pp.h.in
++++ b/include/snmp_pp/config_snmp_pp.h.in
+@@ -28,6 +28,10 @@
+ #ifndef _CONFIG_SNMP_PP_H_
+ #define _CONFIG_SNMP_PP_H_
+ 
++#ifdef __linux__
++#include <sys/socket.h>
++#endif
++
+ #define SNMP_PP_VERSION_STRING "@VERSION@"
+ #define SNMP_PP_VERSION @SNMP_PP_MAJOR_VERSION@
+ #define SNMP_PP_RELEASE @SNMP_PP_MINOR_VERSION@
+diff --git a/include/snmp_pp/smival.h b/include/snmp_pp/smival.h
+index 7a36fab..7522087 100644
+--- a/include/snmp_pp/smival.h
++++ b/include/snmp_pp/smival.h
+@@ -59,6 +59,7 @@
+ #define _SMIVALUE
+ 
+ //----[ includes ]-----------------------------------------------------
++#include <string.h>
+ #include "snmp_pp/smi.h"
+ 
+ #ifdef SNMP_PP_NAMESPACE
+-- 
+1.8.3.2
+
-- 
1.8.3.2
