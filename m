From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 21 Jun 2013 10:59:44 -0700
Subject: [Buildroot] [PATCH] tinyhttpd: do not link against pthread
Message-ID: <1371837584-6270-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Original patch for tinyhttpd disables pthread support from the code
but does not disable it from makefile.
This patch disables pthread support altogether

Fixes:
http://autobuild.buildroot.net/results/2e61a80fcbddd62c76e0406c34ab44d14a4b5c79

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
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
-- 
1.7.4.1
