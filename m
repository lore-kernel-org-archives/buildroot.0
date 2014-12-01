From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:41:16 +0100
Subject: [Buildroot] [git commit] inadyn: install configuration file
	unconditionally
Message-ID: <20141201234334.9B4357FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1557b855c57c2f0dd24230213b3875ae75ef341
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/inadyn.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 73d95db..b002f94 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -20,10 +20,8 @@ INADYN_CONF_OPTS += --disable-ssl
 endif
 
 define INADYN_INSTALL_SAMPLE_CONFIG
-	@if [ ! -f $(TARGET_DIR)/etc/inadyn.conf ]; then \
-		$(INSTALL) -D -m 0600 package/inadyn/inadyn.conf \
-			$(TARGET_DIR)/etc/inadyn.conf; \
-	fi
+	$(INSTALL) -D -m 0600 package/inadyn/inadyn.conf \
+		$(TARGET_DIR)/etc/inadyn.conf
 endef
 INADYN_POST_INSTALL_TARGET_HOOKS += INADYN_INSTALL_SAMPLE_CONFIG
 
