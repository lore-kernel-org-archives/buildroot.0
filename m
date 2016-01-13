From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 22:16:10 +0100
Subject: [Buildroot] [git commit] package/vlc: Add optional dependency to
	libbluray
Message-ID: <20160113211741.9AAB37FDDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57ce16aa27ab96efdcc6d95cfabd38fd20711990
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libbluray is an optional dependency of vlc:
http://git.videolan.org/gitweb.cgi?p=vlc.git;a=blob;f=configure.ac;h=d44151b3fb507141ce7f9b98e95fa11edcdaac01;hb=HEAD#l1739

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
