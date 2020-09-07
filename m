From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  7 Sep 2020 08:56:58 +0200
Subject: [Buildroot] [PATCH-2020.02.x] package/go: security bump to version
 1.13.15
Message-ID: <20200907065658.28428-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

CVE-2020-16845: Go before 1.13.15 and 14.x before 1.14.7 can have an
infinite read loop in ReadUvarint and ReadVarint in encoding/binary via
invalid inputs

https://github.com/golang/go/issues/40620

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index f58449d079..ce8e27c977 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	197333e97290e9ea8796f738d61019dcba1c377c2f3961fd6a114918ecc7ab06  go1.13.14.src.tar.gz
+sha256	5fb43171046cf8784325e67913d55f88a683435071eef8e9da1aa8a1588fcf5d  go1.13.15.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 72604a250b..1f95bec82d 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.14
+GO_VERSION = 1.13.15
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.20.1
