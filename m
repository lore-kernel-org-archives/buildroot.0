From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 18:22:00 +0100
Subject: [Buildroot] [PATCH-2018.02.x] package/go: security bump to version
 1.9.7
Message-ID: <20181215172200.8270-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

go1.9.1 (released 2017/10/04) includes two security fixes.

go1.9.2 (released 2017/10/25) includes fixes to the compiler, linker,
runtime, documentation, go command, and the crypto/x509, database/sql, log,
and net/smtp packages.  It includes a fix to a bug introduced in Go 1.9.1
that broke go get of non-Git repositories under certain conditions.

go1.9.3 (released 2018/01/22) includes fixes to the compiler, runtime, and
the database/sql, math/big, net/http, and net/url packages.

go1.9.4 (released 2018/02/07) includes a security fix to ?go get?.

go1.9.5 (released 2018/03/28) includes fixes to the compiler, go command,
and net/http/pprof package.

go1.9.6 (released 2018/05/01) includes fixes to the compiler and go command.

go1.9.7 (released 2018/06/05) includes fixes to the go command, and the
crypto/x509, and strings packages.  In particular, it adds minimal support
to the go command for the vgo transition.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 445a0b7c20..ad14cd6393 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # From https://golang.org/dl/
-sha256	a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993	go1.9.src.tar.gz
+sha256	582814fa45e8ecb0859a208e517b48aa0ad951e3b36c7fff203d834e0ef27722	go1.9.7.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index 23facbdd81..811e68fd49 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.9
+GO_VERSION = 1.9.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.11.0
