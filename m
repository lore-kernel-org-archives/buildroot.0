From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 22:15:42 +0100
Subject: [Buildroot] [git commit] package/vlc: Add optional dependency to
	zlib
Message-ID: <20160113211741.64AA2827D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bf68d30b8ce29dda48858cb98cf2c9c7058327e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib is an optional dependency of vlc:
http://git.videolan.org/gitweb.cgi?p=vlc.git;a=blob;f=configure.ac;h=d44151b3fb507141ce7f9b98e95fa11edcdaac01;hb=HEAD#l811

Thanks to Yann for pointing this out:
http://patchwork.ozlabs.org/patch/529248/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
