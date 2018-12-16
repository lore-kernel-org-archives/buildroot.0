From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:55:14 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/go: security bump
 to version 1.11.4
Message-ID: <20181216215115.B5EEB7FB8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=516d45a4984bfd7503940de74164b05d8a59968c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

go 1.11.3 fixes the following security issues:

cmd/go: remote command execution during "go get -u"
The issue is CVE-2018-16873 and Go issue golang.org/issue/29230. See the Go issue for details.
Thanks to Etienne Stalmans from the Heroku platform security team for discovering and reporting this issue.

cmd/go: directory traversal in "go get" via curly braces in import paths
The issue is CVE-2018-16874 and Go issue golang.org/issue/29231. See the Go issue for details.
Thanks to ztz of Tencent Security Platform for discovering and reporting this issue.

crypto/x509: CPU denial of service in chain validation
The issue is CVE-2018-16875 and Go issue golang.org/issue/29233. See the Go issue for details.
Thanks to Netflix for discovering and reporting this issue.

go 1.11.4 fixes issues, including regressions introduced by 1.11.3:

1.11.4 includes fixes to cgo, the compiler, linker, runtime, documentation, go
command, and the net/http and go/types packages.  It includes a fix to a bug
introduced in Go 1.11.3 that broke go get for import path patterns
containing "...".

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d810fee306e9a3b9c2408e2927288c1bc4c8d699)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bd6af0358f..ee1c881e6a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	042fba357210816160341f1002440550e952eb12678f7c9e7e9d389437942550  go1.11.2.src.tar.gz
+sha256	4cfd42720a6b1e79a8024895fa6607b69972e8e32446df76d6ce79801bbadb15  go1.11.4.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 2e434f3bad..0d7b961dda 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.11.2
+GO_VERSION = 1.11.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
