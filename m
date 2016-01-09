From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jan 2016 22:03:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/vlc: Add optional dependency to
	libbluray
In-Reply-To: <1452373435-5426-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452373435-5426-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452373435-5426-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libbluray is an optional dependency of vlc:
http://git.videolan.org/gitweb.cgi?p=vlc.git;a=blob;f=configure.ac;h=d44151b3fb507141ce7f9b98e95fa11edcdaac01;hb=HEAD#l1739

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 61b00e9..8acdc4e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -179,6 +179,13 @@ else
 VLC_CONF_OPTS += --disable-libass
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
+VLC_CONF_OPTS += --enable-bluray
+VLC_DEPENDENCIES += libbluray
+else
+VLC_CONF_OPTS += --disable-bluray
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBPSI),y)
 VLC_CONF_OPTS += --enable-dvbpsi
 VLC_DEPENDENCIES += libdvbpsi
-- 
2.6.4
