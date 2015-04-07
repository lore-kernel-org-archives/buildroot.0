From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 23:27:23 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional libenca
	support
Message-ID: <20150407212927.C19D0818B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2552729232b4d9c5cb63ad247d6d94ab83e48e49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 9da90f2..14e8c77 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -53,6 +53,13 @@ else
 MPLAYER_CONF_OPTS += --disable-fontconfig
 endif
 
+ifeq ($(BR2_PACKAGE_LIBENCA),y)
+MPLAYER_CONF_OPTS += --enable-enca
+MPLAYER_DEPENDENCIES += libenca
+else
+MPLAYER_CONF_OPTS += --disable-enca
+endif
+
 # We intentionally don't pass --enable-fribidi, to let the
 # autodetection find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
