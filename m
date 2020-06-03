From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Jun 2020 23:00:32 +0200
Subject: [Buildroot] [git commit] package/nodejs: security bump to 12.18.0
Message-ID: <20200603210546.67443813A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06decad41bcf187ad88fde1fe8039e6fb65fabc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a security release.

Vulnerabilities fixed:

CVE-2020-8172: TLS session reuse can lead to host certificate verification bypass (High).
CVE-2020-11080: HTTP/2 Large Settings Frame DoS (Low).
CVE-2020-8174: napi_get_value_string_*() allows various kinds of memory corruption (High).

See https://nodejs.org/en/blog/release/v12.18.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/nodejs.hash | 6 +++---
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 411b4d52b9..60d69a8638 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.16.3/SHASUMS256.txt
-sha256  f0559b0829c7f2ac10bf5b3e157e498227e95e26cdb6af814969c49f367359a3  node-v12.16.3.tar.xz
+# From https://nodejs.org/dist/v12.18.0/SHASUMS256.txt
+sha256  d4688636a378367f5157f02bd5c13902f5c193356f8f7a35c99dfa383b03b13f  node-v12.18.0.tar.xz
 
 # Hash for license file
-sha256  3f5749f7a58edaadd77843057a90063a18067f472d8b26c0a76905cafa1063e3  LICENSE
+sha256  cd2e5817a25d7d28efba927b01056cae04a616b673014159f9eafeb008a0e747  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index c46dc0e224..37d7877226 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.16.3
+NODEJS_VERSION = 12.18.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
