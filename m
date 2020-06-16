From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 16 Jun 2020 12:03:35 -0500
Subject: [Buildroot] [RFC v9 04/10] cpe-info: cpe minor version support
In-Reply-To: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200616170341.45098-4-matthew.weber@rockwellcollins.com>
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
index efdde0ad94..3bc9567652 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -974,7 +974,8 @@ endif
 $(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)_project
 $(2)_CPE_ID_NAME ?= $$($(2)_NAME)
 $(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
-$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)
+$(2)_CPE_ID_VERSION_MINOR ?= *
+$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_VERSION_MINOR)
 
 ifneq ($(filter linux linux-headers,$(1)),)
 $(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
-- 
2.17.1
