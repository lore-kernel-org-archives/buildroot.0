From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 21:17:10 +0200
Subject: [Buildroot] [git commit] snappy: needs autoreconf
Message-ID: <20140602191854.AB7BA9CE48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88107de5522725a3d5d5b492a696eb76e14f5e15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/0ec/0ec62efed0e0aec56b4aa6b5ef1a3bcbd1474949/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snappy/snappy.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 6d20df8..fd89325 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -8,6 +8,8 @@ SNAPPY_VERSION = 1ff9be9b8fafc8528ca9e055646f5932aa5db9c4
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3c
 SNAPPY_LICENSE_FILES = COPYING
+# from git
+SNAPPY_AUTORECONF = YES
 SNAPPY_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
