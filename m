From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Oct 2018 09:55:21 +0200
Subject: [Buildroot] [git commit] package/vlc: fix linking with tremor
Message-ID: <20181003075643.0C5A08B755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=550c42509c203891c47d934b058a19c2fa490973
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0004 is not enough anymore to fix linking with tremor (provides
libvorbisidec) so we provide the proper content for VORBIS_LIBS.

Fixes
http://autobuild.buildroot.net/results/15a/15a3c5b90de6c67db9887e3db67b3568f6d18e3a/
http://autobuild.buildroot.net/results/946/946f397bb81ce2c69384fa1e378c40600fd405b6/
http://autobuild.buildroot.net/results/f5d/f5d9f3df78626178274c1be878a2ae0b90394885/
http://autobuild.buildroot.net/results/2e5/2e5dc746a59798a56d3127aadc88593fc584c010/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 73f84d5eb2..4d2e5f26c2 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -512,6 +512,7 @@ VLC_CONF_OPTS += --disable-taglib
 endif
 
 ifeq ($(BR2_PACKAGE_TREMOR),y)
+VLC_CONF_ENV += VORBIS_LIBS="-lvorbisidec"
 VLC_CONF_OPTS += --enable-tremor
 VLC_DEPENDENCIES += tremor
 else
