From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:52:02 +0200
Subject: [Buildroot] [PATCH 07/16] erlang-p1-stringprep: bump to version
	1.0.8
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-8-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove a patch that has been applied upstream.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 .../0001-Stdint-is-required-on-windows.patch       | 28 ----------------------
 .../erlang-p1-stringprep/erlang-p1-stringprep.hash |  2 +-
 .../erlang-p1-stringprep/erlang-p1-stringprep.mk   |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/erlang-p1-stringprep/0001-Stdint-is-required-on-windows.patch

diff --git a/package/erlang-p1-stringprep/0001-Stdint-is-required-on-windows.patch b/package/erlang-p1-stringprep/0001-Stdint-is-required-on-windows.patch
deleted file mode 100644
index 7385503b71..0000000000
--- a/package/erlang-p1-stringprep/0001-Stdint-is-required-on-windows.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f5a2b8b78afb253630ee8833f16f131b3b52701e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Pawe=C5=82=20Chmielowski?= <pchmielowski@process-one.net>
-Date: Mon, 29 Feb 2016 10:56:32 +0100
-Subject: [PATCH] Stdint is required on windows
-
-[Backport from upstream commit
-4fc5cae81122540fff983e40dda1fa905c329fd0, which happens to not only
-fix the build on Windows, but also with the musl C library.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- c_src/stringprep.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/c_src/stringprep.cpp b/c_src/stringprep.cpp
-index 461cf09..26215cf 100644
---- a/c_src/stringprep.cpp
-+++ b/c_src/stringprep.cpp
-@@ -19,6 +19,7 @@
-  */
- 
- #include <string.h>
-+#include <stdint.h>
- #include <erl_nif.h>
- 
- #include "uni_data.c"
--- 
-2.7.4
-
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index 23bc6fbdce..ee7bdd9660 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5a74277e7bfb18b8f35838fa78fcde83f0acdb5b2a5b90c4b6d2470a33f7911e erlang-p1-stringprep-1.0.0.tar.gz
+sha256 9d7485312d023eeb83f308206ff8088c03b49195fb7bf4b3b699d386e33e908a erlang-p1-stringprep-1.0.8.tar.gz
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 3bc8c7290b..2355918975 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 1.0.0
+ERLANG_P1_STRINGPREP_VERSION = 1.0.8
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
-- 
2.11.0
