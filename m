From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jan 2017 13:16:44 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] openssl: security bump to
	version 1.0.2k
Message-ID: <20170127122052.1791381F85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=841fc4f3c5340841c8729be629f8db82fa800202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes:
CVE-2017-3731 - Truncated packet could crash via OOB read.
CVE-2017-3732 - BN_mod_exp may produce incorrect results on x86_64
CVE-2016-7055 - Montgomery multiplication may produce incorrect results

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f9a6a2df56012b2ee6d171ca9371910c668bfa78)
---
 package/openssl/openssl.hash | 4 ++--
 package/openssl/openssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 0dc5450..064eeca 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.0.2j.tar.gz.sha256
-sha256	e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431	openssl-1.0.2j.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2k.tar.gz.sha256
+sha256	6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0	openssl-1.0.2k.tar.gz
 # Locally computed
 sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 814c435..1536982 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.2j
+OPENSSL_VERSION = 1.0.2k
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
