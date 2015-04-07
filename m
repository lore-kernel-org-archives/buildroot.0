From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 23:26:20 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional libass
	support
Message-ID: <20150407212927.B74517FF84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e346abf618bc7fd09de6fe1a5bee3b70eab1dbf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: rely on autodetection.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 9f6c1e6..9da90f2 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -111,6 +111,12 @@ else
 MPLAYER_CONF_OPTS += --disable-mencoder
 endif
 
+# We intentionally don't pass --disable-ass-internal --enable-ass and
+# let autodetection find which library to link with.
+ifeq ($(BR2_PACKAGE_LIBASS),y)
+MPLAYER_DEPENDENCIES += libass
+endif
+
 ifeq ($(BR2_PACKAGE_TREMOR),y)
 MPLAYER_DEPENDENCIES += tremor
 MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
