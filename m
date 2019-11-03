From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sun,  3 Nov 2019 17:56:40 +0100
Subject: [Buildroot] [PATCH 15/15] package/tor: adapt to preset-all
In-Reply-To: <20191103165640.21819-1-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
Message-ID: <20191103165640.21819-16-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor was not enabled, we now need to disable it explicitely

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/tor/50-tor.preset | 1 +
 package/tor/tor.mk        | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 package/tor/50-tor.preset

diff --git a/package/tor/50-tor.preset b/package/tor/50-tor.preset
new file mode 100644
index 0000000000..8664cb9ca5
--- /dev/null
+++ b/package/tor/50-tor.preset
@@ -0,0 +1 @@
+disable tor.service
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 264d8d06da..2785c1a518 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -61,6 +61,8 @@ TOR_POST_INSTALL_TARGET_HOOKS += TOR_INSTALL_CONF
 define TOR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(@D)/contrib/dist/tor.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/tor.service
+	$(INSTALL) -D -m 644 package/tor/50-tor.preset \
+		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-tor.preset
 endef
 
 $(eval $(autotools-package))
-- 
2.24.0.rc1
