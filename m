From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Jun 2018 19:16:23 +0200
Subject: [Buildroot] [PATCH 1/1] tinymembench: bump to version 0.4
Message-ID: <20180608171623.12720-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Use LICENSE instead of main.c in TINYMEMBENCH_LICENSE_FILES
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinymembench/tinymembench.hash | 3 ++-
 package/tinymembench/tinymembench.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tinymembench/tinymembench.hash b/package/tinymembench/tinymembench.hash
index 813a1df429..59ca70dcb2 100644
--- a/package/tinymembench/tinymembench.hash
+++ b/package/tinymembench/tinymembench.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 e8cfcf0817eb8430f736426bc7557273765cef0e8002a17cca51645114e723b7  tinymembench-v0.3.tar.gz
+sha256 e37a2682065b2778f2fa7f22bd59472f5ca2191be48503952ae020b8f023f23d  tinymembench-v0.4.tar.gz
+sha256 8ba473aced4630aee2808efe17b53e904a9d68a9b3361de491717f9a4e75da39  LICENSE
diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
index ab479d64e3..b2ccc749fe 100644
--- a/package/tinymembench/tinymembench.mk
+++ b/package/tinymembench/tinymembench.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-TINYMEMBENCH_VERSION = v0.3
+TINYMEMBENCH_VERSION = v0.4
 TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,$(TINYMEMBENCH_VERSION))
 TINYMEMBENCH_LICENSE = MIT
-TINYMEMBENCH_LICENSE_FILES = main.c
+TINYMEMBENCH_LICENSE_FILES = LICENSE
 
 define TINYMEMBENCH_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-- 
2.14.1
