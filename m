From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 31 Aug 2009 22:11:36 +0200
Subject: [Buildroot] [git commit master] util-linux: use := instead of = to
	stop recursion
Message-ID: <20090831205205.A92E976CD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=49c47f55a87a5b7bcc688afce07348608ecce454
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unbreaks util-linux together with busybox

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/util-linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ad5a62c..8f38a3c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -72,7 +72,7 @@ $(UTIL-LINUX_TARGET_BINARY): $(UTIL-LINUX_BINARY)
 #If both util-linux and busybox are selected, make certain util-linux
 #wins the fight over who gets to have their utils actually installed
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-UTIL-LINUX_DEPENDENCIES = busybox $(UTIL-LINUX_DEPENDENCIES)
+UTIL-LINUX_DEPENDENCIES := busybox $(UTIL-LINUX_DEPENDENCIES)
 endif
 
 util-linux: uclibc $(UTIL-LINUX_DEPENDENCIES) $(UTIL-LINUX_TARGET_BINARY)
-- 
1.6.3.3
