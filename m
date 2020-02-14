From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 14 Feb 2020 13:48:25 +0100
Subject: [Buildroot] [PATCH v2 08/10] package/ripgrep: bump to version 11.0.1
In-Reply-To: <20200214124827.30767-1-patrick.havelange@essensium.com>
References: <20200214124827.30767-1-patrick.havelange@essensium.com>
Message-ID: <20200214124827.30767-8-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump is needed because the old cached archive of the
tarball of ripgrep is still using the old format and can't
be used anymore (as the expected content of the final archive has
changed with the recent infrastructure changes for cargo packages).

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 package/ripgrep/ripgrep.hash | 2 +-
 package/ripgrep/ripgrep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 8c48458cd8..1e70cbae5a 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 cb895cff182740c219fefbbaaf903e60f005a4ac4688cac1e43e5fbbbccc5a94 ripgrep-0.8.1.tar.gz
+sha256 c02fe3077c95872175b098d002f872a619195436569a7dff443bbb605bc27474 ripgrep-11.0.1.tar.gz
 sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 97e9e2ce5f..1023b4bad8 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RIPGREP_VERSION = 0.8.1
+RIPGREP_VERSION = 11.0.1
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
-- 
2.17.1
