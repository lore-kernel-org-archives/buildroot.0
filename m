From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Oct 2014 09:48:07 -0300
Subject: [Buildroot] [PATCH 2/3] mpd: fix upnp build failure
In-Reply-To: <1414500488-32597-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414500488-32597-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1414500488-32597-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix build failure:
http://autobuild.buildroot.net/results/7ff/7ff28551b9c72658eb75394e7cbd1904861f23e3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...np-Discovery-add-missing-stdlib.h-include.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/mpd/0001-upnp-Discovery-add-missing-stdlib.h-include.patch

diff --git a/package/mpd/0001-upnp-Discovery-add-missing-stdlib.h-include.patch b/package/mpd/0001-upnp-Discovery-add-missing-stdlib.h-include.patch
new file mode 100644
index 0000000..ff581c3
--- /dev/null
+++ b/package/mpd/0001-upnp-Discovery-add-missing-stdlib.h-include.patch
@@ -0,0 +1,30 @@
+From 1901bd9d6be651fbaa5c7659d92d3361e6d6a823 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 28 Oct 2014 07:25:48 -0300
+Subject: [PATCH] upnp/Discovery: add missing stdlib.h include
+
+Used for free().
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: Sent upstream.
+
+ src/lib/upnp/Discovery.cxx | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/lib/upnp/Discovery.cxx b/src/lib/upnp/Discovery.cxx
+index 9ea78c6..2c91e37 100644
+--- a/src/lib/upnp/Discovery.cxx
++++ b/src/lib/upnp/Discovery.cxx
+@@ -26,6 +26,8 @@
+ 
+ #include <upnp/upnptools.h>
+ 
++#include <stdlib.h>
++
+ #include <string.h>
+ 
+ // The service type string we are looking for.
+-- 
+2.0.4
+
-- 
2.0.4
