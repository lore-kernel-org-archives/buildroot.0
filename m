From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 31 Oct 2010 21:34:18 +0100
Subject: [Buildroot] [git commit master 1/1] libgtk2: Fix pixbuf loaders
	cache file generation
Message-ID: <20101031203436.ABA318D756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=763d4ef9ea66312671f56fd35aeab7a53a173980
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After libgtk was bumped to 2.22.0 default loacation of
pixbuf loaders cache changed.
Use --update-cache flag for gdk-pixbuf-query-loaders
which does waht we need.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgtk2/S26libgtk2 |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libgtk2/S26libgtk2 b/package/libgtk2/S26libgtk2
index da5cc6e..037746d 100644
--- a/package/libgtk2/S26libgtk2
+++ b/package/libgtk2/S26libgtk2
@@ -2,13 +2,12 @@
 #
 # run pgdk-pixbuf-query-loaders if needed
 
-FILE=/etc/gtk-2.0/gdk-pixbuf.loaders
+FILE=/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 
 case "$1" in
     start|"")
 	if [ ! -f "$FILE" ] ; then
-	    mkdir -p /etc/gtk-2.0
-	    /usr/bin/gdk-pixbuf-query-loaders > "$FILE"
+	    /usr/bin/gdk-pixbuf-query-loaders --update-cache
 	fi
 	;;
     stop)
-- 
1.7.1
