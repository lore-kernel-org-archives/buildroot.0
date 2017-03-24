From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 24 Mar 2017 09:47:43 +0100
Subject: [Buildroot] [PATCH] upmpdcli: add user to the audio group
Message-ID: <20170324084743.1233-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upmpdcli runs as user and group upmpdcli. In order to allow it to access
the ALSA devices add it to the audio group.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 83efa0530..a9b057d82 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -12,7 +12,7 @@ UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
 
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
-	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli MPD UPnP Renderer Front-End
+	upmpdcli -1 upmpdcli -1 * - - audio Upmpdcli MPD UPnP Renderer Front-End
 endef
 
 define UPMPDCLI_INSTALL_INIT_SYSV
-- 
2.12.1
