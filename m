From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 17:39:37 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: update configure options
Message-ID: <20151018153953.2C92C81DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c49041bb254fd36e42ce287b167067b45941357
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- always disable new gio_unix_2_0 option (only used for testing)

[Thomas: add comment in .mk file.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gst1-plugins-base/gst1-plugins-base.mk         |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 08ebe03..2d646e0 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -18,10 +18,12 @@ GST1_PLUGINS_BASE_CONF_ENV =
 	FT2_CONFIG=/bin/false \
 	ac_cv_header_stdint_t="stdint.h"
 
+# gio_unix_2_0 is only used for tests
 GST1_PLUGINS_BASE_CONF_OPTS = \
 	--disable-examples \
 	--disable-oggtest \
 	--disable-vorbistest \
+	--disable-gio_unix_2_0 \
 	--disable-freetypetest \
 	--disable-valgrind
 
