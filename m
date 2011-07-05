From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Jul 2011 14:58:20 +0200
Subject: [Buildroot] [git commit] lame: fix build if host has libgtk12-dev
	(gtk-config)
Message-ID: <20110705130146.02BA98A334@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0387830b2e6c6cb2513802b8abe86914d49f605c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lame contains an optional gtk12 based frame analyzer application, which
will be built if gtk12 is detected (using gtk-config). We no longer
have support for (the obsolete) gtk12 in BR, but the host might have
gtk-config, so forcible disable it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/lame/lame.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index 841cbff..281c1e8 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -8,6 +8,7 @@ LAME_VERSION = 3.98.4
 LAME_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lame
 LAME_DEPENDENCIES = host-pkg-config
 LAME_INSTALL_STAGING = YES
+LAME_CONF_ENV = GTK_CONFIG=/bin/false
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
-- 
1.7.3.4
