From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 14 Jun 2020 14:19:12 -0700
Subject: [Buildroot] [PATCH 1/2] package/janus-gateway: bump to version
 0.10.1
Message-ID: <20200614211913.646488-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../0002-Add-test-for-Wunused-but-set-variable.patch      | 8 ++++----
 package/janus-gateway/janus-gateway.hash                  | 4 ++--
 package/janus-gateway/janus-gateway.mk                    | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index ac6b045078..c68d6b3b02 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -26,12 +26,12 @@ Signed-off-by: Adam Duskett <Aduskett@gmail.com>
  create mode 100644 m4/ax_check_compile_flag.m4
 
 diff --git a/Makefile.am b/Makefile.am
-index c6e9ad2..42d256b 100644
+index f961fdb..3ddbe59 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -140,6 +140,7 @@ janus_CFLAGS = \
- 	-DTRANSPORTDIR=\"$(transportdir)\" \
+@@ -151,6 +151,7 @@ janus_CFLAGS = \
  	-DEVENTDIR=\"$(eventdir)\" \
+ 	-DLOGGERDIR=\"$(loggerdir)\" \
  	-DCONFDIR=\"$(confdir)\" \
 +	@GCC_WARN_UNUSED_BUT_SET@ \
  	$(BORINGSSL_CFLAGS) \
@@ -60,7 +60,7 @@ index ca17a29..beef91a 100644
 +		-Wunsafe-loop-optimizations"
  esac
  
- JANUS_VERSION=63
+ JANUS_VERSION=101
 diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
 new file mode 100644
 index 0000000..51df0c0
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index c61ffcd5b6..64af919519 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b6829edaf25862fbf613e2c3d2be7cad29943c0bb1ea5d1b935a07abfee37245 janus-gateway-0.9.2.tar.gz
-sha256 91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6 COPYING
+sha256  731760e6911908bc523815809487e51320a738f3533f267d4beb83eaa725de85  janus-gateway-0.10.1.tar.gz
+sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index bbc7f95ee1..0ecd83fce1 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.9.2
+JANUS_GATEWAY_VERSION = 0.10.1
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.26.2
