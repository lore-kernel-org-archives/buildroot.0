From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed,  1 Oct 2014 23:00:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: Fix build with uclibc on
	SH4
Message-ID: <1412197256-618-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing header file <cstdio> to the uclibc patch to fix build with target SH4.

Fixes:
  http://autobuild.buildroot.net/results/e5be8fe46a30f0b417fe5fc19a27c480d885791e/
  http://autobuild.buildroot.net/results/a3453afddff4fc03681f7fbdff3ccab9706eb189/

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch | 33 ++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
index ee6b716..4109972 100644
--- a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
+++ b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
@@ -1,3 +1,11 @@
+From 722ffb8612631b9f11d888c737facdcb0580aaad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
+Date: Wed, 1 Oct 2014 22:31:11 +0200
+Subject: [PATCH 1/1] uclibc fixes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Add necessary fixes to build with uClibc
 
  - Missing #include of C library headers
@@ -11,12 +19,13 @@ Signed-off-by: J?rg Krause <jkrause@posteo.de>
  libupnpp/control/renderingcontrol.cxx | 2 ++
  libupnpp/device/device.cxx            | 1 +
  libupnpp/soaphelp.cxx                 | 4 ++++
+ libupnpp/upnpavutils.cxx              | 1 +
  upmpd/upmpd.cxx                       | 1 +
  upmpd/upmpdutils.cxx                  | 7 +++++++
- 7 files changed, 18 insertions(+)
+ 8 files changed, 19 insertions(+)
 
 diff --git a/libupnpp/control/avtransport.cxx b/libupnpp/control/avtransport.cxx
-index 1aa79e2..d48af23 100644
+index 1348007..27d3b4c 100644
 --- a/libupnpp/control/avtransport.cxx
 +++ b/libupnpp/control/avtransport.cxx
 @@ -15,6 +15,8 @@
@@ -29,7 +38,7 @@ index 1aa79e2..d48af23 100644
  #include <functional>
  
 diff --git a/libupnpp/control/ohplaylist.cxx b/libupnpp/control/ohplaylist.cxx
-index 5269a5d..fe95cc1 100644
+index 53ac8a9..3f5c71f 100644
 --- a/libupnpp/control/ohplaylist.cxx
 +++ b/libupnpp/control/ohplaylist.cxx
 @@ -14,6 +14,7 @@
@@ -41,7 +50,7 @@ index 5269a5d..fe95cc1 100644
  
  #include <string>
 diff --git a/libupnpp/control/renderingcontrol.cxx b/libupnpp/control/renderingcontrol.cxx
-index 818e7c3..17d28ee 100644
+index 38b5457..26453fb 100644
 --- a/libupnpp/control/renderingcontrol.cxx
 +++ b/libupnpp/control/renderingcontrol.cxx
 @@ -15,6 +15,8 @@
@@ -80,6 +89,18 @@ index 8f25185..f4358b9 100644
  #include <iostream>
  using namespace std;
  
+diff --git a/libupnpp/upnpavutils.cxx b/libupnpp/upnpavutils.cxx
+index 41caa31..3fb4fa3 100644
+--- a/libupnpp/upnpavutils.cxx
++++ b/libupnpp/upnpavutils.cxx
+@@ -14,6 +14,7 @@
+  *       Free Software Foundation, Inc.,
+  *       59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+  */
++#include <cstdio>
+ #include <string>
+ using namespace std;
+ 
 diff --git a/upmpd/upmpd.cxx b/upmpd/upmpd.cxx
 index 3b45cdd..bc506ff 100644
 --- a/upmpd/upmpd.cxx
@@ -93,7 +114,7 @@ index 3b45cdd..bc506ff 100644
  #include <string>
  #include <iostream>
 diff --git a/upmpd/upmpdutils.cxx b/upmpd/upmpdutils.cxx
-index 2830a2e..7cea612 100644
+index 3534064..4de5145 100644
 --- a/upmpd/upmpdutils.cxx
 +++ b/upmpd/upmpdutils.cxx
 @@ -21,6 +21,8 @@
@@ -125,5 +146,5 @@ index 2830a2e..7cea612 100644
  // Translate VolumeDB to MPD 0-100
  int dbvaluetopercent(int dbvalue)
 -- 
-2.1.1
+2.1.2
 
-- 
2.1.2
