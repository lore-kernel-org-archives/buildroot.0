From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jan 2016 22:03:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/vlc: Add optional dependency to zlib
Message-ID: <1452373435-5426-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib is an optional dependency of vlc:
http://git.videolan.org/gitweb.cgi?p=vlc.git;a=blob;f=configure.ac;h=d44151b3fb507141ce7f9b98e95fa11edcdaac01;hb=HEAD#l811

Thanks to Yann for pointing this out:
http://patchwork.ozlabs.org/patch/529248/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index a080e3e..61b00e9 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -368,4 +368,8 @@ else
 VLC_CONF_OPTS += --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+VLC_DEPENDENCIES += zlib
+endif
+
 $(eval $(autotools-package))
-- 
2.6.4
