From: Christian Stewart <christian@paral.in>
Date: Wed, 17 Feb 2021 14:21:54 -0800
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.16
Message-ID: <20210217222154.2144796-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://golang.org/doc/go1.16

The latest Go release, version 1.16, arrives six months after Go 1.15. Most of
its changes are in the implementation of the toolchain, runtime, and libraries.

The linker changes in 1.16 extend the 1.15 improvements to all supported
architecture/OS combinations (the 1.15 performance improvements were primarily
focused on ELF-based OSes and amd64 architectures). For a representative set of
large Go programs, linking is 20-25% faster than 1.15 and requires 5-15% less
memory on average for linux/amd64, with larger improvements for other
architectures and OSes. Most binaries are also smaller as a result of more
aggressive symbol pruning.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index cbc82a9b64..4181fb52c5 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2  go1.15.8.src.tar.gz
+sha256  7688063d55656105898f323d90a79a39c378d86fe89ae192eb3b7fc46347c95a  go1.16.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 7b7f173706..9946682730 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.8
+GO_VERSION = 1.16
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.30.1
