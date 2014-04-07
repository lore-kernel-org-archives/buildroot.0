From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 01:18:29 +0200
Subject: [Buildroot] [git commit] snmppp: fix missing includes
Message-ID: <20140407232955.B77A59C64B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa4e4471f7b35b75880c7edc176805c22e81d8d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../snmppp/snmppp-01-Add-missing-includes.patch    |   41 ++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

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
