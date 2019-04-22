From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:26:30 +0200
Subject: [Buildroot] [git commit] package/samba4: fix build with NLS
Message-ID: <20190422202153.E1A348147F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1764115e78c8aa3f038bbe41eec1b60cbc5aabb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/52586a2b8680869fc904ffcac548cf0d683070a6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3f16b5be4a..f6dbda9dbb 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -18,7 +18,7 @@ SAMBA4_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
 SAMBA4_CFLAGS = $(TARGET_CFLAGS)
-SAMBA4_LDFLAGS = $(TARGET_LDFLAGS)
+SAMBA4_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 SAMBA4_CONF_ENV = \
 	CFLAGS="$(SAMBA4_CFLAGS)" \
 	LDFLAGS="$(SAMBA4_LDFLAGS)"
