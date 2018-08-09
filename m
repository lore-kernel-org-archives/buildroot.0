From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:50:30 +0200
Subject: [Buildroot] [git commit branch/next] package/c-periphery: bump to
 1.1.3
Message-ID: <20180809084508.6E39A8B6BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62df8bfc4463f6970d9c8c894b4dfe76a2262e86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Specific areas of bugfixes:
- serial: 8th bit being stripped when using parity
- gpio: add retry loop waiting for exported gpio dir
- i2c: update i2c supported functions query for 64-bit
- add support for building with C++

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-periphery/c-periphery.hash | 3 ++-
 package/c-periphery/c-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index 524925ff97..745e44a71c 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 c6cfaae7496ff6500b747106571de6b4ca7d80a383297e592ffcfa3413b66321  c-periphery-v1.1.1.tar.gz
+sha256 50665a4f298b30e4cc8f7dbd38362fd860cc3746803d00325cb04806674e3166  c-periphery-v1.1.3.tar.gz
+sha256 6b5669a90260126f0600aae98cb10fb5e219269dc9cbd0137f63927b96d5c31d  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index 359c860e89..df26105541 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = v1.1.1
+C_PERIPHERY_VERSION = v1.1.3
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 # only a static library
