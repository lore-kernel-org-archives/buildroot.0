From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 22:19:13 +0200
Subject: [Buildroot] [git commit] rtai: Install modules in
	/lib/modules/<version>/rtai
Message-ID: <20110920202238.89B918D723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d9979692334c917bc8c807e93d78a47849c1e06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The /lib/modules/<version>/kernel/ is completely rewritten by the
kernel module installation, so third party modules should be outside
of this directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rtai/rtai.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index abba614..a4a69f9 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -8,7 +8,7 @@ RTAI_CONF_OPT = \
 	--with-linux-dir=$(LINUX_DIR) 	\
 	--disable-leds		      	\
 	--disable-rtailab		\
-	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/kernel/rtai
+	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/rtai
 
 RTAI_MAKE = $(MAKE1)
 
