From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 May 2010 20:56:25 +0200
Subject: [Buildroot] [git commit master] Makefile: make GNU_HOST_NAME a
	simply expanded variable (:=)
Message-ID: <20100506185652.CA0EC8F552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c71816a8a5a9a89f6436925e67e6bce742ee303b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU_HOST_NAME is referred more than 100 times in the tree, used 5
times during startup, and is relatively expensive to run - so make
it a simple expanded variable (:=) rather than recursively expanded
one (=).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 5da21d8..a4bf4b5 100644
--- a/Makefile
+++ b/Makefile
@@ -153,7 +153,7 @@ cc-option=$(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev
 unexport CROSS_COMPILE
 unexport ARCH
 
-GNU_HOST_NAME=$(shell package/gnuconfig/config.guess)
+GNU_HOST_NAME:=$(shell package/gnuconfig/config.guess)
 
 #############################################################
 #
-- 
1.6.3.3
