From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 14:57:14 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/go: security bump
 to version 1.13.7
Message-ID: <20200307134712.DC1B98FB71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=251d0fd438a4d70084f32088b25bfba3ae4d7abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security issue:

- Panic in crypto/x509 certificate parsing and golang.org/x/crypto/cryptobyte

On 32-bit architectures, a malformed input to crypto/x509 or the ASN.1
parsing functions of golang.org/x/crypto/cryptobyte can lead to a panic.
The malformed certificate can be delivered via a crypto/tls connection to a
client, or to a server that accepts client certificates.  net/http clients
can be made to crash by an HTTPS server, while net/http servers that accept
client certificates will recover the panic and are unaffected.  Thanks to
Project Wycheproof for providing the test cases that led to the discovery of
this issue.  The issue is CVE-2020-7919 and Go issue golang.org/issue/36837.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f40acb4684be2aed970242da8b16bff12d921993)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index f440490b4e..b607ce37d4 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	aae5be954bdc40bcf8006eb77e8d8a5dde412722bc8effcdaf9772620d06420c  go1.13.6.src.tar.gz
+sha256	e4ad42cc5f5c19521fbbbde3680995f2546110b5c6aa2b48c3754ff7af9b41f4  go1.13.7.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a0f796c21b..43c04ac0c5 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.6
+GO_VERSION = 1.13.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
