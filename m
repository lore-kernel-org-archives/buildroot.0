From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:18 +0100
Subject: [Buildroot] [PATCHv2 60/74] stunnel: install configuration file
	unconditionally
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-61-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/stunnel/stunnel.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index ac2963e..3d0596d 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -19,9 +19,8 @@ STUNNEL_CONF_OPTS += --disable-systemd
 endif
 
 define STUNNEL_INSTALL_CONF
-	[ -f $(TARGET_DIR)/etc/stunnel/stunnel.conf ] || \
-		$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf \
-			$(TARGET_DIR)/etc/stunnel/stunnel.conf
+	$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf \
+		$(TARGET_DIR)/etc/stunnel/stunnel.conf
 	rm -f $(TARGET_DIR)/etc/stunnel/stunnel.conf-sample
 endef
 
-- 
2.1.0
