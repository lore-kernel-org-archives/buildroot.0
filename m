From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:53:03 +0100
Subject: [Buildroot] [git commit] upmpdcli: add user to the audio group
Message-ID: <20170325135307.494738226E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab9842e360ae08954b07504a20cd053fe146f383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

upmpdcli runs as user and group upmpdcli. In order to allow it to access
the ALSA devices add it to the audio group.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/upmpdcli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 83efa05..a9b057d 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -12,7 +12,7 @@ UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
 
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
-	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli MPD UPnP Renderer Front-End
+	upmpdcli -1 upmpdcli -1 * - - audio Upmpdcli MPD UPnP Renderer Front-End
 endef
 
 define UPMPDCLI_INSTALL_INIT_SYSV
