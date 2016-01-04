From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jan 2016 21:55:07 +0100
Subject: [Buildroot] [git commit] pciutils: correct dns disabling logic
Message-ID: <20160104205529.9F153826BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85e2a87699f4f98d1b669576922581ae3bcac004
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #8581

Commit 2c879f95a0 (pciutils: cleanup) refactored the make arguments, but
accidently changed the logic to disable dns based lookups to pass
PCIUTILS_DNS=no instead of DNS=no, causing the autotection to be used.

This autodetection looks at host includes, so it isn't safe for cross
compilation.

Disable it by setting the correct make variable instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pciutils/pciutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 24f250e..d3a0e20 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -17,7 +17,7 @@ PCIUTILS_MAKE_OPTS = \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	RANLIB=$(TARGET_RANLIB) \
 	AR=$(TARGET_AR) \
-	PCIUTILS_DNS=no
+	DNS=no
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 PCIUTILS_DEPENDENCIES += udev
