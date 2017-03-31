From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 08:59:57 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] upmpdcli: add user to the
	audio group
Message-ID: <20170331071606.C0E62826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03316d1719645ea47aac6de3a29877345c5e0a67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

upmpdcli runs as user and group upmpdcli. In order to allow it to access
the ALSA devices add it to the audio group.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit ab9842e360ae08954b07504a20cd053fe146f383)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
