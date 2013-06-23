From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Jun 2013 21:47:15 +0200
Subject: [Buildroot] [git commit] tinyhttpd: do not link against pthread
Message-ID: <20130623200856.689DD9B141@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3cf32ebf55c203ec4d3fcd566ca64bf173b9079
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Original patch for tinyhttpd disables pthread support from the code
but does not disable it from makefile.
This patch disables pthread support altogether

Fixes:
http://autobuild.buildroot.net/results/2e61a80fcbddd62c76e0406c34ab44d14a4b5c79

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tinyhttpd/tinyhttpd.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tinyhttpd/tinyhttpd.patch b/package/tinyhttpd/tinyhttpd.patch
index 02eb189..05d6e50 100644
--- a/package/tinyhttpd/tinyhttpd.patch
+++ b/package/tinyhttpd/tinyhttpd.patch
@@ -73,7 +73,7 @@ diff -ur tinyhttpd-0.1.0/Makefile tinyhttpd-0.1.0-patched/Makefile
  
  httpd: httpd.c
 -	gcc -W -Wall -lsocket -lpthread -o httpd httpd.c
-+	$(CC) $(CFLAGS) $(LDFLAGS) -W -Wall -lpthread -o httpd httpd.c
++	$(CC) $(CFLAGS) $(LDFLAGS) -W -Wall -o httpd httpd.c
  
  clean:
 -	rm httpd
