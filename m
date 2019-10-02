From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 08:07:49 +0200
Subject: [Buildroot] [git commit] package/go: security bump to version
 1.12.10
Message-ID: <20191002060608.62C62873DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd574c445c598fc14ae5cc37ec1fd7fcddd08862
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerabilities:

- CVE-2019-16276: Go before 1.12.10 and 1.13.x before 1.13.1 allow HTTP
  Request Smuggling.
  https://github.com/golang/go/issues/34540

From the release notes:

go1.12.10 (released 2019/09/25) includes security fixes to the net/http and
net/textproto packages

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index a4820ee67a..8dfcff7a73 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc  go1.12.9.src.tar.gz
+sha256	f56e48fce80646d3c94dcf36d3e3f490f6d541a92070ad409b87b6bbb9da3954  go1.12.10.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 9b7263a49a..f8727850b5 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.12.9
+GO_VERSION = 1.12.10
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
