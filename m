From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 22:27:28 +0100
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.13.3
Message-ID: <20191027212729.1687-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues (1.33.2):

- CVE-2019-17596: Invalid DSA public keys can cause a panic in dsa.Verify.
  In particular, using crypto/x509.Verify on a crafted X.509 certificate
  chain can lead to a panic, even if the certificates don?t chain to a
  trusted root.  The chain can be delivered via a crypto/tls connection to a
  client, or to a server that accepts and verifies client certificates.
  net/http clients can be made to crash by an HTTPS server, while net/http
  servers that accept client certificates will recover the panic and are
  unaffected.

Additionally, 1.13.3 fixes a number of issues. From the release notes:

Fixes to the go command, the toolchain, the runtime, syscall, net, net/http,
and crypto/ecdsa packages

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 3c6799c5fc..442a6f9ad2 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	81f154e69544b9fa92b1475ff5f11e64270260d46e7e36c34aafc8bc96209358  go1.13.1.src.tar.gz
+sha256	4f7123044375d5c404280737fbd2d0b17064b66182a65919ffe20ffe8620e3df  go1.13.3.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 73c049412c..64e831189f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.1
+GO_VERSION = 1.13.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.20.1
