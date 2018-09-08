From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 14:47:59 +0200
Subject: [Buildroot] [git commit] botan: fix build on arm without neon
Message-ID: <20180908124730.7C20082BA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4aa2399cd6a7bb2a5fe599a9ba2cba2f6d961a97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure.py only supports --disable-neon

Fixes:
 - http://autobuild.buildroot.org/results/26eec7e20795068613616a7312681853232ec764

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 39a2c4c72b..e352fab6c9 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -74,6 +74,10 @@ ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
 BOTAN_CONF_OPTS += --disable-altivec
 endif
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),)
+BOTAN_CONF_OPTS += --disable-neon
+endif
+
 define BOTAN_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure.py $(BOTAN_CONF_OPTS))
 endef
