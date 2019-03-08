From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  8 Mar 2019 16:04:22 -0600
Subject: [Buildroot] [PATCH v8 4/9] cpe-info: cpe minor version support
In-Reply-To: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1552082667-46877-5-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minor version are used to allow -rc, - and other variants of
representing a sub release in the CPE dictionary.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes

v8
- New support to allow rc, -,  and p# minor versions as the CPE dict
  currently uses these on a number of packages.
---
 package/Makefile.in    | 2 +-
 package/pkg-generic.mk | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 644282f..3e93145 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -391,7 +391,7 @@ TARGET_CONFIGURE_ARGS = \
 
 CPE_PREFIX_OS = cpe:2.3:o
 CPE_PREFIX_APP = cpe:2.3:a
-CPE_SUFFIX = *:*:*:*:*:*:*
+CPE_SUFFIX = *:*:*:*:*:*
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 NLS_OPTS = --enable-nls
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8ff389e..1b895d0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -914,7 +914,8 @@ endif
 $(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)_project
 $(2)_CPE_ID_NAME ?= $$($(2)_NAME)
 $(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
-$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)
+$(2)_CPE_ID_VERSION_MINOR ?= *
+$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_VERSION_MINOR)
 
 ifneq ($(filter linux linux-headers,$(1)),)
 $(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
-- 
1.9.1
