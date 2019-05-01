From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 22:10:31 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/go: bump version
 to 1.11.9
Message-ID: <20190501201631.BC0AB839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acd3da78d53dedee902838b2f44757bf3ffaa3e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes a number of issues discovered since 1.11.6.  From the release notes:

go1.11.7 (released 2019/04/05) includes fixes to the runtime and the net
packages.  See the Go 1.11.7 milestone on our issue tracker for details.

go1.11.8 (released 2019/04/08) was accidentally released without its
intended fix.  It is identical to go1.11.7, except for its version number.
The intended fix is in go1.11.9.

go1.11.9 (released 2019/04/11) fixes an issue where using the prebuilt
binary releases on older versions of GNU/Linux led to failures when linking
programs that used cgo.  Only Linux users who hit this issue need to update.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index fad5f29a71..77aa273aa9 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	a96da1425dcbec094736033a8a416316547f8100ab4b72c31d4824d761d3e133  go1.11.6.src.tar.gz
+sha256	ee80684b352f8d6b49d804d4e615f015ae92da41c4096cfee89ed4783b2498e3  go1.11.9.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index b91040a103..6b8b0de6b1 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.11.6
+GO_VERSION = 1.11.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
