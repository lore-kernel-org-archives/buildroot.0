From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2020 11:06:52 +0200
Subject: [Buildroot] [git commit] package/dropbear: bump to version 2020.79
Message-ID: <20200622091030.3E5327F924@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6623560a265eff75a10a0b416d0fa077d86bc185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CBC ciphers, 3DES and hmac-sha1-96 are now disabled by default.

LICENSE: curve25519-donna under BSD-3c was replaced by curve25519.c under
Public domain

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.hash | 4 ++--
 package/dropbear/dropbear.mk   | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index aa0e80a20a..ab53197f32 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256 525965971272270995364a0eb01f35180d793182e63dd0b0c3eb0292291644a4 dropbear-2019.78.tar.bz2
+sha256  084f00546b1610a3422a0773e2c04cbe1a220d984209e033b548b49f379cc441  dropbear-2020.79.tar.bz2
 
 # License file, locally computed
-sha256 cfa32d49e9022265375e533a4a5ef9e37d4aaa604119d612c46816aa1e59fe52 LICENSE
+sha256  2ac2be75a2232ec2473070dd791ee990253dffde6022d364809bbbcbc30f710e  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 1070a410b9..b32f39d647 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2019.78
+DROPBEAR_VERSION = 2020.79
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
-DROPBEAR_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause
+DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
 DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
@@ -58,9 +58,6 @@ endif
 
 ifneq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
 define DROPBEAR_DISABLE_LEGACY_CRYPTO
-	echo '#define DROPBEAR_3DES 0'                  >> $(@D)/localoptions.h
-	echo '#define DROPBEAR_ENABLE_CBC_MODE 0'       >> $(@D)/localoptions.h
-	echo '#define DROPBEAR_SHA1_96_HMAC 0'          >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_DSS 0'                   >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_DH_GROUP1 0'             >> $(@D)/localoptions.h
 endef
