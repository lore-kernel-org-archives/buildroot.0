From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:01:25 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional libiconv
	support
Message-ID: <20150408212257.E481C80406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5575b651199994a1adc8a91e681f4ded0eb2d31c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 5e29551..2ddc0fc 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -68,6 +68,14 @@ else
 MPLAYER_CONF_OPTS += --disable-fribidi
 endif
 
+# We intentionally don't pass --enable-libiconv, to let the
+# autodetection find which library to link with.
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MPLAYER_DEPENDENCIES += libiconv
+else
+MPLAYER_CONF_OPTS += --disable-iconv
+endif
+
 # We intentionally don't pass --enable-termcap, in order to let the
 # autodetection find with which library to link with. Otherwise, we
 # would have to pass it manually.
