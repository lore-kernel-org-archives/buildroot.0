From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Apr 2021 14:59:37 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/bridge-utils:
 bump to version 1.7.1
Message-ID: <20210424124716.E99F985789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=359aa439a582b77dc137791e74145f8217c751f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes compile warnings with gcc 10.x:
https://git.kernel.org/pub/scm/network/bridge/bridge-utils.git/commit/?h=main&id=a1f20223cfcf7b9eae8c9e7e7a07e7bf1377f65b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5f2d38df4f85f7999cf6d00da089991cba93fee6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bridge-utils/bridge-utils.hash | 4 +++-
 package/bridge-utils/bridge-utils.mk   | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/bridge-utils/bridge-utils.hash b/package/bridge-utils/bridge-utils.hash
index ccf71704b8..60cdd1cec1 100644
--- a/package/bridge-utils/bridge-utils.hash
+++ b/package/bridge-utils/bridge-utils.hash
@@ -1,3 +1,5 @@
+# From https://mirrors.edge.kernel.org/pub/linux/utils/net/bridge-utils/sha256sums.asc
+sha256  a61d8be4f1a1405c60c8ef38d544f0c18c05b33b9b07e5b4b31033536165e60e  bridge-utils-1.7.1.tar.xz
+
 # locally computed
-sha256  4b9b12f31d147320dea931f1041b8a69d84741ddb92cf35ea1f896b67da98b7c  bridge-utils-1.7.tar.gz
 sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  COPYING
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index 2de5517fc5..e8e9a3ca3a 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-BRIDGE_UTILS_VERSION = 1.7
-BRIDGE_UTILS_SITE = \
-	https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git/snapshot
+BRIDGE_UTILS_VERSION = 1.7.1
+BRIDGE_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/bridge-utils
+BRIDGE_UTILS_SOURCE = bridge-utils-$(BRIDGE_UTILS_VERSION).tar.xz
 BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_LICENSE = GPL-2.0+
 BRIDGE_UTILS_LICENSE_FILES = COPYING
