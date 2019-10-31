From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 16:02:43 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/go: security bump
 to version 1.12.12
Message-ID: <20191031200042.2C6818E2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3882d58aa393cff7224ca02f994ebfbc89d19b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fixes the following security issues (1.12.11):

- CVE-2019-17596: Invalid DSA public keys can cause a panic in dsa.Verify.
  In particular, using crypto/x509.Verify on a crafted X.509 certificate
  chain can lead to a panic, even if the certificates don???t chain to a
  trusted root.  The chain can be delivered via a crypto/tls connection to a
  client, or to a server that accepts and verifies client certificates.
  net/http clients can be made to crash by an HTTPS server, while net/http
  servers that accept client certificates will recover the panic and are
  naffected.

Additionally, 1.12.11 fixes a number of issues. From the release notes:

fixes to the go command, runtime, syscall and net packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 8dfcff7a73..8126fc6526 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	f56e48fce80646d3c94dcf36d3e3f490f6d541a92070ad409b87b6bbb9da3954  go1.12.10.src.tar.gz
+sha256	fcb33b5290fa9bcc52be3211501540df7483d7276b031fc77528672a3c705b99  go1.12.12.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f8727850b5..0b8fdb793b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.12.10
+GO_VERSION = 1.12.12
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
