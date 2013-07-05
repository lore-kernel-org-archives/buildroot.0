From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Jul 2013 09:12:02 +0200
Subject: [Buildroot] [git commit] uclibc: fixup more unicode madness
Message-ID: <20130705071606.7EA609A32E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7528e5d0b7f1241fa4b3a4f94ca3d9e52a349ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This should be @D, and not some kind of funky unicode character.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uclibc/uclibc.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 5cbc011..421e323 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -114,7 +114,7 @@ ifeq ($(UCLIBC_TARGET_ARCH),sh)
 UCLIBC_SH_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_SH_TYPE))
 define UCLIBC_SH_TYPE_CONFIG
 	$(SED) '/CONFIG_SH[234A]*/d' $(@D)/.config
-	$(call UCLIBC_OPT_SET,$(UCLIBC_SH_TYPE),y,$(@??))
+	$(call UCLIBC_OPT_SET,$(UCLIBC_SH_TYPE),y,$(@D))
 endef
 endif # sh
 
@@ -126,7 +126,7 @@ ifeq ($(UCLIBC_TARGET_ARCH),sparc)
 UCLIBC_SPARC_TYPE = CONFIG_SPARC_$(call qstrip,$(BR2_UCLIBC_SPARC_TYPE))
 define UCLIBC_SPARC_TYPE_CONFIG
 	$(SED) 's/^\(CONFIG_[^_]*[_]*SPARC[^=]*\)=.*/# \1 is not set/g' \
-		 $(@??)/.config
+		 $(@D)/.config
 	$(call UCLIBC_OPT_SET,$(UCLIBC_SPARC_TYPE),y,$(@D))
 endef
 endif # sparc
