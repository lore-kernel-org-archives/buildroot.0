From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 21:52:18 +0100
Subject: [Buildroot] [git commit] libcdio: cdda-player depends on ncurses
Message-ID: <20140127210827.7E8B89C696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c80977deda5b32f0b911f3b4a8c984f881fe36c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcdio/libcdio.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index 07cb987..2e3e2cf 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -15,4 +15,10 @@ ifeq ($(BR2_ENABLE_LOCALE),)
 LIBCDIO_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+LIBCDIO_DEPENDENCIES += ncurses
+else
+LIBCDIO_CONF_OPT += --without-cdda-player
+endif
+
 $(eval $(autotools-package))
