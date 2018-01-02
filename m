From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 22:40:30 +0100
Subject: [Buildroot] [git commit] package/sysdig: bump to version 0.19.1
Message-ID: <20180102214033.0A48083A64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=091fcd2f652b5c5dd9ccbc66ddf17716ae07c6df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps sysdig to version 0.19.1 and removes
an upstreamed patch.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../sysdig/0001-Don-t-include-curlbuild.h.patch    | 58 ----------------------
 package/sysdig/sysdig.hash                         |  2 +-
 package/sysdig/sysdig.mk                           |  2 +-
 3 files changed, 2 insertions(+), 60 deletions(-)

diff --git a/package/sysdig/0001-Don-t-include-curlbuild.h.patch b/package/sysdig/0001-Don-t-include-curlbuild.h.patch
deleted file mode 100644
index 5b53bb1..0000000
--- a/package/sysdig/0001-Don-t-include-curlbuild.h.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 8a6670ea4b57c0e2bf8588d4534b22d1ea860989 Mon Sep 17 00:00:00 2001
-From: Mark Stemm <mark.stemm@gmail.com>
-Date: Tue, 15 Aug 2017 17:49:53 -0700
-Subject: [PATCH] Don't include curlbuild.h
-
-It's not required to build and it's not present with some newer versions
-of libcurl, so removing it.
-
-Thanks to https://github.com/hhoffstaette for the tip.
-
-This fixes https://github.com/draios/sysdig/issues/895.
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
----
- userspace/libsinsp/marathon_http.cpp | 1 -
- userspace/libsinsp/mesos_http.cpp    | 1 -
- userspace/sysdig.project             | 1 -
- 3 files changed, 3 deletions(-)
-
-diff --git a/userspace/libsinsp/marathon_http.cpp b/userspace/libsinsp/marathon_http.cpp
-index f7937b6..2e4449a 100644
---- a/userspace/libsinsp/marathon_http.cpp
-+++ b/userspace/libsinsp/marathon_http.cpp
-@@ -7,7 +7,6 @@
- #include "marathon_http.h"
- #include "curl/curl.h"
- #include "curl/easy.h"
--#include "curl/curlbuild.h"
- #define BUFFERSIZE 512 // b64 needs this macro
- #include "b64/encode.h"
- #include "sinsp.h"
-diff --git a/userspace/libsinsp/mesos_http.cpp b/userspace/libsinsp/mesos_http.cpp
-index 18ac9f5..c6bfb58 100644
---- a/userspace/libsinsp/mesos_http.cpp
-+++ b/userspace/libsinsp/mesos_http.cpp
-@@ -7,7 +7,6 @@
- #include "mesos_http.h"
- #include "curl/curl.h"
- #include "curl/easy.h"
--#include "curl/curlbuild.h"
- #include "sinsp.h"
- #include "sinsp_int.h"
- #include "sinsp_curl.h"
-diff --git a/userspace/sysdig.project b/userspace/sysdig.project
-index 5d00f18..76a18f0 100644
---- a/userspace/sysdig.project
-+++ b/userspace/sysdig.project
-@@ -752,7 +752,6 @@
-             </VirtualDirectory>
-             <VirtualDirectory Name="include">
-               <VirtualDirectory Name="curl">
--                <File Name="../build/release/curl-prefix/src/curl/include/curl/curlbuild.h"/>
-                 <File Name="../build/release/curl-prefix/src/curl/include/curl/easy.h"/>
-                 <File Name="../build/release/curl-prefix/src/curl/include/curl/stdcheaders.h"/>
-                 <File Name="../build/release/curl-prefix/src/curl/include/curl/curlrules.h"/>
--- 
-2.7.4
-
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index 8305413..63a9e38 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  f009acc32f2b15fcb0d2267bde6f6de9b3445179003c979ba61a8836abdb78f9  sysdig-0.17.0.tar.gz
+sha256  480d5d8fd7e7373c08008c30bd8e2c7595d5c45d710bf07bd15a522021b560f6  sysdig-0.19.1.tar.gz
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index ecafb9d..a9c9f21 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.17.0
+SYSDIG_VERSION = 0.19.1
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
