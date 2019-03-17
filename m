From: Christian Stewart <christian@paral.in>
Date: Sat, 16 Mar 2019 19:01:42 -0700
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12.1
Message-ID: <20190317020142.743-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Go 1.12 was released on 2/25/2019: https://blog.golang.org/go1.12

Go 1.12.1 was released on 3/14/2019:
https://golang.org/doc/devel/release.html#go1.12.minor

Additional notes on how Go modules will evolve in 2019 are here:
https://blog.golang.org/modules2019

In Go 1.12, module support remains the same as in Go 1.11. GOPATH is scheduled
for deprecation in 1.13, however. The Buildroot Go package infrastructure should
therefore aim to migrate to a new, currently undefined, Go module friendly
compilation approach before Go 1.13 is released.

Signed-off-by: Christian Stewart <christian@paral.in>

package/go: bump to 1.12.1

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 29891399c3..60aa1e1f57 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	bc1ef02bb1668835db1390a2e478dcbccb5dd16911691af9d75184bbe5aa943e  go1.11.5.src.tar.gz
+sha256	0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a  go1.12.1.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 4daa2fe093..c27f161f48 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.11.5
+GO_VERSION = 1.12.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.19.2
