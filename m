From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Dec 2017 08:31:34 +0100
Subject: [Buildroot] [PATCH 3/3] package/vlc: switch to libupnp-1.8
In-Reply-To: <20171214073134.28696-1-bernd.kuhls@t-online.de>
References: <20171214073134.28696-1-bernd.kuhls@t-online.de>
Message-ID: <20171214073134.28696-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vlc now supports libupnp-1.8:
http://git.videolan.org/?p=vlc/vlc-2.2.git;a=commitdiff;h=825dca78be3a81e2a1c5d04137aa01b1cb32dfd3

Fixes
http://autobuild.buildroot.net/results/d98/d98bdcc745a2480d4664db2427f0ae1c9c5ea71e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 30520c3072..84693588fd 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -281,9 +281,9 @@ else
 VLC_CONF_OPTS += --disable-theora
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+ifeq ($(BR2_PACKAGE_LIBUPNP18),y)
 VLC_CONF_OPTS += --enable-upnp
-VLC_DEPENDENCIES += libupnp
+VLC_DEPENDENCIES += libupnp18
 else
 VLC_CONF_OPTS += --disable-upnp
 endif
-- 
2.11.0
