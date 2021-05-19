From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 19 May 2021 09:59:38 +0200
Subject: [Buildroot] [PATCH] package/grpc: bump to version 1.37.1
Message-ID: <20210519075938.85560-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes from Changelog [0]:
 - Fix #25897 to avoid crashes when certificates are not yet updated
 - [Backport] Fix use-after-unref bug in fault_injection_filter.

[0] https://github.com/grpc/grpc/releases/tag/v1.37.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/grpc/grpc.hash | 2 +-
 package/grpc/grpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 8189f738b5..925761f37a 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c2dc8e876ea12052d6dd16704492fd8921df8c6d38c70c4708da332cf116df22  grpc-1.37.0.tar.gz
+sha256  acf247ec3a52edaee5dee28644a4e485c5e5badf46bdb24a80ca1d76cb8f1174  grpc-1.37.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index ee8dc38e70..fce69cbe56 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.37.0
+GRPC_VERSION = 1.37.1
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
-- 
2.25.1
