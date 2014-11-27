From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:30 +0100
Subject: [Buildroot] [PATCHv2 72/74] inadyn: install configuration file
	unconditionally
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-73-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/inadyn/inadyn.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

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
 
-- 
2.1.0
