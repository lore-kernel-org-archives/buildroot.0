From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:14:14 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libss7: add -fPIC
Message-ID: <20190902151007.3C6468A2C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b660b9c44bf85981d2ff3bf17f0affcc83bc25b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e3f169fa78514691fa85dbdf5e6a51ff8301241c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libss7/libss7.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libss7/libss7.mk b/package/libss7/libss7.mk
index 541505b264..151b6a61b5 100644
--- a/package/libss7/libss7.mk
+++ b/package/libss7/libss7.mk
@@ -36,7 +36,8 @@ endif
 LIBSS7_UTILS = parser_debug ss7test ss7linktest
 
 define LIBSS7_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) \
 		$(LIBSS7_LIBS) $(LIBSS7_UTILS)
 endef
 
