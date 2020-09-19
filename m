From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 23:22:59 +0200
Subject: [Buildroot] [git commit] package/ympd: fix build with gcc 10
Message-ID: <20200919211444.92E1485AB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a0b2d3738d850cd110707d971c817cb2079c06f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ea4b96ba8d4a398515ed349e8304a656b684f718

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ympd/0002-added-forward-declarations.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/ympd/0002-added-forward-declarations.patch b/package/ympd/0002-added-forward-declarations.patch
new file mode 100644
index 0000000000..90ee1eae68
--- /dev/null
+++ b/package/ympd/0002-added-forward-declarations.patch
@@ -0,0 +1,43 @@
+From 2268e0f0f372a61827b912155a1796490968b3ff Mon Sep 17 00:00:00 2001
+From: SuperBFG7 <daniel@despite.ch>
+Date: Tue, 2 Jun 2020 12:41:52 +0200
+Subject: [PATCH] added forward declarations
+
+
+[Retrieved (and slightly updated to remove update of dirble_api_token)
+from:
+https://github.com/notandy/ympd/pull/191/commits/2268e0f0f372a61827b912155a1796490968b3ff]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/mpd_client.c | 2 ++
+ src/mpd_client.h | 6 ++++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/mpd_client.c b/src/mpd_client.c
+index 2911e461..9f003ab0 100644
+--- a/src/mpd_client.c
++++ b/src/mpd_client.c
+@@ -30,6 +30,8 @@
+ 
+ /* forward declaration */
+ static int mpd_notify_callback(struct mg_connection *c, enum mg_event ev);
++char dirble_api_token[28];
++struct t_mpd mpd;
+ 
+ const char * mpd_cmd_strs[] = {
+     MPD_CMDS(GEN_STR)
+diff --git a/src/mpd_client.h b/src/mpd_client.h
+index 447dd563..9342c550 100644
+--- a/src/mpd_client.h
++++ b/src/mpd_client.h
+@@ -96,6 +96,8 @@ struct t_mpd {
+ 
+     int song_id;
+     unsigned queue_version;
+-} mpd;
++};
++
++extern struct t_mpd mpd;
+ 
+ struct t_mpd_client_session {
+     int song_id;
