From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:51:42 +0100
Subject: [Buildroot] [git commit] mpd: fix upnp build failure
Message-ID: <20141028175205.823B1B1C7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7521604c1b99c6261e64e0e0b37395fc38e7775c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix build failure:
http://autobuild.buildroot.net/results/7ff/7ff28551b9c72658eb75394e7cbd1904861f23e3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...np-Discovery-add-missing-stdlib.h-include.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

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
