From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 13:17:21 +0200
Subject: [Buildroot] [git commit] package/go: bump version to 1.12.4
Message-ID: <20190430111513.9AA3383D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f5584af06dddb08acd7a0f290f304d1272805e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a number of issues discovered since 1.12.1.  From the release notes:

go1.12.2 (released 2019/04/05) includes fixes to the compiler, the go
command, the runtime, and the doc, net, net/http/httputil, and os packages.
See the Go 1.12.2 milestone on our issue tracker for details.

go1.12.3 (released 2019/04/08) was accidentally released without its
intended fix.  It is identical to go1.12.2, except for its version number.
The intended fix is in go1.12.4.

go1.12.4 (released 2019/04/11) fixes an issue where using the prebuilt
binary releases on older versions of GNU/Linux led to failures when linking
programs that used cgo.  Only Linux users who hit this issue need to update.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 60aa1e1f57..df3a9c4e43 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a  go1.12.1.src.tar.gz
+sha256	4affc3e610cd8182c47abbc5b0c0e4e3c6a2b945b55aaa2ba952964ad9df1467  go1.12.4.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 8df02cc68d..f31b1941c4 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.12.1
+GO_VERSION = 1.12.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
