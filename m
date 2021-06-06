From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Jun 2021 17:14:22 +0200
Subject: [Buildroot] [git commit] package/go: security bump to version 1.16.5
Message-ID: <20210606144402.890AB812F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c600074199fa49291918039fae6723be90776c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-33195: The LookupCNAME, LookupSRV, LookupMX, LookupNS, and
  LookupAddr functions in net, and their respective methods on the Resolver
  type may return arbitrary values retrieved from DNS which do not follow
  the established RFC 1035 rules for domain names.  If these names are used
  without further sanitization, for instance unsafely included in HTML, they
  may allow for injection of unexpected content.  Note that LookupTXT may
  still return arbitrary values that could require sanitization before
  further use

- CVE-2021-33196: The NewReader and OpenReader functions in archive/zip can
  cause a panic or an unrecoverable fatal error when reading an archive that
  claims to contain a large number of files, regardless of its actual size

- CVE-2021-33197: ReverseProxy in net/http/httputil could be made to forward
  certain hop-by-hop headers, including Connection.  In case the target of
  the ReverseProxy was itself a reverse proxy, this would let an attacker
  drop arbitrary headers, including those set by the ReverseProxy.Director

- CVE-2021-33198: The SetString and UnmarshalText methods of math/big.Rat
  may cause a panic or an unrecoverable fatal error if passed inputs with
  very large exponents

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index a6676bc160..bc6147bb52 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  ae4f6b6e2a1677d31817984655a762074b5356da50fb58722b99104870d43503  go1.16.4.src.tar.gz
+sha256  7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80  go1.16.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 5b87915824..4252691343 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.4
+GO_VERSION = 1.16.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
