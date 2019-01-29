From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:55:35 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/s6-networking:
 fix dependency when libressl is enabled
Message-ID: <20190129215437.8853E821F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1275545888261ba92372178dd04524248e61c33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Commit "c5b85231fb s6-networking: enable SSL if libressl is selected"
actually dropped the dependency on s6-dns and s6 when libressl is
enabled.
Fix this by using += inside the conditional code.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 30ff614a035dd49e357f7c3560555dae8e605f80)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/s6-networking/s6-networking.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 7c9f087051..b621eb225d 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -25,7 +25,7 @@ S6_NETWORKING_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 S6_NETWORKING_CONF_OPTS += --enable-ssl=libressl
-S6_NETWORKING_DEPENDENCIES = libressl
+S6_NETWORKING_DEPENDENCIES += libressl
 endif
 
 define S6_NETWORKING_CONFIGURE_CMDS
