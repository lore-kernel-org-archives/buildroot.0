From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 16:37:36 +0200
Subject: [Buildroot] [git commit] package/s6-networking: support building
 with bearssl
Message-ID: <20210501141613.B70DD868A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d87e069d9890bf6b5864977083f54b0f1c8be52d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/s6-networking/s6-networking.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index d687c567cd..8869186669 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -26,6 +26,9 @@ S6_NETWORKING_CONF_OPTS = \
 ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 S6_NETWORKING_CONF_OPTS += --enable-ssl=libressl
 S6_NETWORKING_DEPENDENCIES += libressl
+else ifeq ($(BR2_PACKAGE_BEARSSL),y)
+S6_NETWORKING_CONF_OPTS += --enable-ssl=bearssl
+S6_NETWORKING_DEPENDENCIES += bearssl
 endif
 
 define S6_NETWORKING_CONFIGURE_CMDS
