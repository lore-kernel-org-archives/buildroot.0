From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 16:42:44 +0200
Subject: [Buildroot] [git commit] less: bump to version 481
Message-ID: <20151019150706.426B681E87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0155bd50b098293ddb47386e888f697273169efd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch site to gnu mirror since the stable releases are mirrored there.
Also use gpg sig to calculate hash, from the gnu mirror.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/less/less.hash |    4 ++--
 package/less/less.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index b1a227e..eea201d 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	e536c7819ede54b3d487f0ffc4c14b3620bed83734d92a81e89f62346db0fcac	less-458.tar.gz
+# Locally calculated after checking pgp signature
+sha256	3fa38f2cf5e9e040bb44fffaa6c76a84506e379e47f5a04686ab78102090dda5	less-481.tar.gz
diff --git a/package/less/less.mk b/package/less/less.mk
index 39ef395..c217543 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LESS_VERSION = 458
-LESS_SITE = http://www.greenwoodsoftware.com/less
+LESS_VERSION = 481
+LESS_SITE = $(BR2_GNU_MIRROR)/less
 LESS_LICENSE = GPLv3+
 LESS_LICENSE_FILES = COPYING
 # Build after busybox, full-blown is better
