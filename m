From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jan 2015 21:48:02 +0100
Subject: [Buildroot] [git commit] dropbear: bump to version 2015.67
Message-ID: <20150128205818.9679C80E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e48670167f9eb72e2af1d415ce9fe521338a1e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch sed options around since defaults have changed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.hash |    4 ++--
 package/dropbear/dropbear.mk   |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index f7042c3..30856cc 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
-# From https://matt.ucc.asn.au/dropbear/releases/SHA1SUM.asc
-sha1	793f5f1bb465b3c55e795d607932e8b21c130e95	dropbear-2014.66.tar.bz2
+# From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
+sha256	7e690594645dfde5787065c78a5d2e4d15e288babfa06e140197ce05f698c8e5	dropbear-2015.67.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 696095d..6e020c2 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2014.66
+DROPBEAR_VERSION = 2015.67
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
@@ -30,14 +30,14 @@ define DROPBEAR_ENABLE_REVERSE_DNS
 endef
 
 define DROPBEAR_BUILD_SMALL
-	$(SED) 's:.*\(#define DROPBEAR_SMALL_CODE\).*:\1:' $(@D)/options.h
 	$(SED) 's:.*\(#define NO_FAST_EXPTMOD\).*:\1:' $(@D)/options.h
 endef
 
 define DROPBEAR_BUILD_FEATURED
+	$(SED) 's:^#define DROPBEAR_SMALL_CODE::' $(@D)/options.h
 	$(SED) 's:.*\(#define DROPBEAR_BLOWFISH\).*:\1:' $(@D)/options.h
-	$(SED) 's:.*\(#define DROPBEAR_SHA2_256_HMAC\).*:\1:' $(@D)/options.h
-	$(SED) 's:.*\(#define DROPBEAR_SHA2_512_HMAC\).*:\1:' $(@D)/options.h
+	$(SED) 's:.*\(#define DROPBEAR_TWOFISH128\).*:\1:' $(@D)/options.h
+	$(SED) 's:.*\(#define DROPBEAR_TWOFISH256\).*:\1:' $(@D)/options.h
 endef
 
 define DROPBEAR_DISABLE_STANDALONE
