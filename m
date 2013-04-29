From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 09:17:15 +0200
Subject: [Buildroot] [git commit] pciutils: ensure cross-pkgconfig is used
Message-ID: <20130429071822.CE0D99B8D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebb07458b56326b3bca6f65a5881d9ef05bb8434
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For build with libkmod.

Fixes http://autobuild.buildroot.net/results/70cdca5c5a41a14277c616fba3a58d8aa5fa5a2c/build-end.log

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pciutils/pciutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 2cd10c0..c1ae094 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -40,7 +40,7 @@ define PCIUTILS_CONFIGURE_CMDS
 endef
 
 define PCIUTILS_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
 		HOST="$(KERNEL_ARCH)-linux" \
 		OPT="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
