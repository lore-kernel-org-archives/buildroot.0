From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 15:19:26 +0200
Subject: [Buildroot] [git commit] mpd: fix build failures with gcc 4.9.x
Message-ID: <20140709134616.3B80C9D1E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a5d7de8df9d7c460fa8aeddb2d4a4905f83ebcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Sagaert Johan in the mailing list mpd 0.18.x fails to
build with gcc 4.9.x
Patch status: sent upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fileDecoderPlugin-fix-build-failure-due-t.patch |   26 ++++++++++++++++++++
 ...ecoderPlugin-fix-build-failure-due-to-mis.patch |   26 ++++++++++++++++++++
 ...lient-fix-build-failure-due-to-missing-st.patch |   26 ++++++++++++++++++++
 ...laylistPlugin-fix-build-failure-due-to-mi.patch |   26 ++++++++++++++++++++
 4 files changed, 104 insertions(+), 0 deletions(-)

diff --git a/package/mpd/mpd-0001-decoder-AudiofileDecoderPlugin-fix-build-failure-due-t.patch b/package/mpd/mpd-0001-decoder-AudiofileDecoderPlugin-fix-build-failure-due-t.patch
new file mode 100644
index 0000000..b4c5753
--- /dev/null
+++ b/package/mpd/mpd-0001-decoder-AudiofileDecoderPlugin-fix-build-failure-due-t.patch
@@ -0,0 +1,26 @@
+From 58c9d0c314119a571862b21b2f4e4bf7bbe88a57 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 8 Jul 2014 10:39:12 -0300
+Subject: [PATCH 1/4] decoder/AudiofileDecoderPlugin: fix build failure due to
+ missing stdio.h include
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/decoder/AudiofileDecoderPlugin.cxx | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/decoder/AudiofileDecoderPlugin.cxx b/src/decoder/AudiofileDecoderPlugin.cxx
+index ab3557e..92223f2 100644
+--- a/src/decoder/AudiofileDecoderPlugin.cxx
++++ b/src/decoder/AudiofileDecoderPlugin.cxx
+@@ -31,6 +31,7 @@
+ #include <af_vfs.h>
+ 
+ #include <assert.h>
++#include <stdio.h>
+ 
+ /* pick 1020 since its devisible for 8,16,24, and 32-bit audio */
+ #define CHUNK_SIZE		1020
+-- 
+1.8.5.5
+
diff --git a/package/mpd/mpd-0002-decoder-OpusDecoderPlugin-fix-build-failure-due-to-mis.patch b/package/mpd/mpd-0002-decoder-OpusDecoderPlugin-fix-build-failure-due-to-mis.patch
new file mode 100644
index 0000000..fa68fd8
--- /dev/null
+++ b/package/mpd/mpd-0002-decoder-OpusDecoderPlugin-fix-build-failure-due-to-mis.patch
@@ -0,0 +1,26 @@
+From 66f19e78a5b8e7b7aefd807218edafcf55ccee55 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 8 Jul 2014 10:39:38 -0300
+Subject: [PATCH 2/4] decoder/OpusDecoderPlugin: fix build failure due to
+ missing stdio.h include
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/decoder/OpusDecoderPlugin.cxx | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/decoder/OpusDecoderPlugin.cxx b/src/decoder/OpusDecoderPlugin.cxx
+index f3d7b34..01ea368 100644
+--- a/src/decoder/OpusDecoderPlugin.cxx
++++ b/src/decoder/OpusDecoderPlugin.cxx
+@@ -40,6 +40,7 @@
+ #include <glib.h>
+ 
+ #include <string.h>
++#include <stdio.h>
+ 
+ static constexpr opus_int32 opus_sample_rate = 48000;
+ 
+-- 
+1.8.5.5
+
diff --git a/package/mpd/mpd-0003-output-HttpdClient-fix-build-failure-due-to-missing-st.patch b/package/mpd/mpd-0003-output-HttpdClient-fix-build-failure-due-to-missing-st.patch
new file mode 100644
index 0000000..232c0ff
--- /dev/null
+++ b/package/mpd/mpd-0003-output-HttpdClient-fix-build-failure-due-to-missing-st.patch
@@ -0,0 +1,26 @@
+From 5f18d45f9583e521e2b2c18b055c4dab7ce126cf Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 8 Jul 2014 10:40:18 -0300
+Subject: [PATCH 3/4] output/HttpdClient: fix build failure due to missing
+ stdio.h include
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/output/HttpdClient.cxx | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/output/HttpdClient.cxx b/src/output/HttpdClient.cxx
+index 8e13fda..dc33705 100644
+--- a/src/output/HttpdClient.cxx
++++ b/src/output/HttpdClient.cxx
+@@ -30,6 +30,7 @@
+ 
+ #include <assert.h>
+ #include <string.h>
++#include <stdio.h>
+ 
+ HttpdClient::~HttpdClient()
+ {
+-- 
+1.8.5.5
+
diff --git a/package/mpd/mpd-0004-playlist-PlsPlaylistPlugin-fix-build-failure-due-to-mi.patch b/package/mpd/mpd-0004-playlist-PlsPlaylistPlugin-fix-build-failure-due-to-mi.patch
new file mode 100644
index 0000000..73b3f0b
--- /dev/null
+++ b/package/mpd/mpd-0004-playlist-PlsPlaylistPlugin-fix-build-failure-due-to-mi.patch
@@ -0,0 +1,26 @@
+From 4181473f66349ceb53f2d4e967f399932b3efa39 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 8 Jul 2014 10:40:50 -0300
+Subject: [PATCH 4/4] playlist/PlsPlaylistPlugin: fix build failure due to
+ missing stdio.h include
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/playlist/PlsPlaylistPlugin.cxx | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/playlist/PlsPlaylistPlugin.cxx b/src/playlist/PlsPlaylistPlugin.cxx
+index 99be3ad..7b5c882 100644
+--- a/src/playlist/PlsPlaylistPlugin.cxx
++++ b/src/playlist/PlsPlaylistPlugin.cxx
+@@ -31,6 +31,7 @@
+ #include <glib.h>
+ 
+ #include <string>
++#include <stdio.h>
+ 
+ static constexpr Domain pls_domain("pls");
+ 
+-- 
+1.8.5.5
+
