From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:03:22 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] libopenssl: security bump
 to version 1.0.2q
Message-ID: <20181203215952.8EB438A61F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6405b1804897ef2d3fb704eeb892875a9c2c92de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes the following security vulnerabilities:

  *) Microarchitecture timing vulnerability in ECC scalar multiplication

     OpenSSL ECC scalar multiplication, used in e.g. ECDSA and ECDH, has been
     shown to be vulnerable to a microarchitecture timing side channel attack.
     An attacker with sufficient access to mount local timing attacks during
     ECDSA signature generation could recover the private key.

     This issue was reported to OpenSSL on 26th October 2018 by Alejandro
     Cabrera Aldaya, Billy Brumley, Sohaib ul Hassan, Cesar Pereida Garcia and
     Nicola Tuveri.
     (CVE-2018-5407)
     [Billy Brumley]

  *) Timing vulnerability in DSA signature generation

     The OpenSSL DSA signature algorithm has been shown to be vulnerable to a
     timing side channel attack. An attacker could use variations in the signing
     algorithm to recover the private key.

     This issue was reported to OpenSSL on 16th October 2018 by Samuel Weiser.
     (CVE-2018-0734)
     [Paul Dale]

For more information, see the changelog:
https://www.openssl.org/news/cl102.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3301b6e1b2e8b22f6caef58ce9289f1ada147f67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 8 ++++----
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 2b1e048751..83fb8bd513 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,7 +1,7 @@
-# From https://www.openssl.org/source/openssl-1.0.2p.tar.gz.sha256
-sha256	50a98e07b1a89eb8f6a99477f262df71c6fa7bef77df4dc83025a2845c827d00	openssl-1.0.2p.tar.gz
-# From https://www.openssl.org/source/openssl-1.0.2p.tar.gz.sha1
-sha1	f34b5322e92415755c7d58bf5d0d5cf37666382c				openssl-1.0.2p.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2q.tar.gz.sha256
+sha256	5744cfcbcec2b1b48629f7354203bc1e5e9b5466998bbccc5b5fcde3b18eb684	openssl-1.0.2q.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2q.tar.gz.sha1
+sha1	692f5f2f1b114f8adaadaa3e7be8cce1907f38c5				openssl-1.0.2q.tar.gz
 # Locally computed
 sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index d8e3dd8b56..ca0521b229 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.0.2p
+LIBOPENSSL_VERSION = 1.0.2q
 LIBOPENSSL_SITE = http://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
