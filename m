From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 20:12:18 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] package/openssl: security
 bump to version 1.0.2m
Message-ID: <20171126213854.CE78B81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdad5c529e038dab63c4eec6f0ea105f3e6a0ef8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fixes the following CVEs:
bn_sqrx8x_internal carry bug on x86_64 (CVE-2017-3736)
Malformed X.509 IPAddressFamily could cause OOB read (CVE-2017-3735)

Release notes: https://www.openssl.org/news/secadv/20171102.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 63023c407fe601d7c349fbff1ef1fbb246b1e288)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl.hash | 4 ++--
 package/openssl/openssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index da911c5..c6226c3 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.0.2l.tar.gz.sha256
-sha256	ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c	openssl-1.0.2l.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2m.tar.gz.sha256
+sha256	8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f	openssl-1.0.2m.tar.gz
 # Locally computed
 sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index ec8e6f2..a123989 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.2l
+OPENSSL_VERSION = 1.0.2m
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
