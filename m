From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Nov 2019 08:42:51 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/freerdp: fix
 pulseaudio support
Message-ID: <20191107073650.3FDE58E9C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6467983e078721122a6907335a6a062e176f54c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The name of the option to enable/disable support for pulseaudio has been
in flux in FreeRDP, sometimes being WITH_PULSE, sometimes being the
erroneous WITH_PULSEAUDIO. Eventually, FreeRDP came to their feet, and
fixed it to WITH_PULSE everywhere.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
[yann.morin.1998 at free.fr:
  - remove useless (obsolete) WITH_PULSEAUDIO
  - fix the else clause too
  - enhance commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 807495a88588ecd675ba4a39fa0de2ad8d2fa05d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 0f32ff4718..293b6b5c01 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -50,10 +50,10 @@ FREERDP_CONF_OPTS += -DWITH_ALSA=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=ON
+FREERDP_CONF_OPTS += -DWITH_PULSE=ON
 FREERDP_DEPENDENCIES += pulseaudio
 else
-FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
+FREERDP_CONF_OPTS += -DWITH_PULSE=OFF
 endif
 
 # For the systemd journal
