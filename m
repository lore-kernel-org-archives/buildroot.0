From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:37 +0200
Subject: [Buildroot] [PATCH 04/17] cpe-info: cpe minor version support
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-5-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Minor version are used to allow -rc, - and other variants of
representing a sub release in the CPE dictionary.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/Makefile.in    | 2 +-
 package/pkg-generic.mk | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c6a21276a2..f66f7041ee 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -375,7 +375,7 @@ TARGET_CONFIGURE_ARGS = \
 
 CPE_PREFIX_OS = cpe:2.3:o
 CPE_PREFIX_APP = cpe:2.3:a
-CPE_SUFFIX = *:*:*:*:*:*:*
+CPE_SUFFIX = *:*:*:*:*:*
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 NLS_OPTS = --enable-nls
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1372dc6e4d..489918b1eb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -973,7 +973,8 @@ endif
 $(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)_project
 $(2)_CPE_ID_NAME ?= $$($(2)_NAME)
 $(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
-$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)
+$(2)_CPE_ID_VERSION_MINOR ?= *
+$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_VERSION_MINOR)
 
 ifneq ($(filter linux linux-headers,$(1)),)
 $(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
-- 
2.28.0
