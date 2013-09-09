From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  9 Sep 2013 23:46:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/pulseaudio: fix files path after
	package/{multimedia => } move
In-Reply-To: <1378763205-6180-1-git-send-email-yann.morin.1998@free.fr>
References: <1378763205-6180-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1378763205-6180-3-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Cset adf6511 moved packages from package/multimedia/ to package/
but forgot to change the paths of files referenced in the .mk files.

Fix path to pulseaudio's startup script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 66265d0..cdeabc5 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -107,7 +107,7 @@ define PULSEAUDIO_USERS
 endef
 
 define PULSEAUDIO_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/multimedia/pulseaudio/S50pulseaudio \
+	$(INSTALL) -D -m 755 package/pulseaudio/S50pulseaudio \
 		$(TARGET_DIR)/etc/init.d/S50pulseaudio
 endef
 
-- 
1.8.1.2
