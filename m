From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:18:54 +0200
Subject: [Buildroot] [git commit] package/v4l2loopback: bump to version
 0.12.2 to fix Linux 5.1 compat
Message-ID: <20190601122012.BE9DF8A554@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a8460d45b3c5cf830355bcdbd54b56f91c00559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a kernel 5.1.x compatibility issue. The only changes
between 0.12.1 and 0.12.2 are:

d3b198ef6f57ca512fb25147c9d85b922fd4651a Released v0.12.2
376c2c28bd7d4470cd92ff646d6087ca70cd9d2e fixed typo
6edc4b164b1f05bee74cb507a4f50776a65ceb73 mentioned support for 5.0.0
0b8feb80fdef9a415d8250bca1790b3ff23e8391 Replace v4l2_get_timestamp with ktime_get_ts(64)
541e3bc7aaf46dc9a21f92c7f527397fce03dfd8 Update README.md

So the only functional change is the actual ktime_get_ts() fix, which
is needed for Linux 5.1 compatibility. Therefore, bumping is pretty
much the same as backporting just this commit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Thomas: extend the commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index 6d661d0a65..0598be486f 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	f2b9b7f8611c1a77b2f496ee505e49860121079c998bb735e4bb6b8954132348  v4l2loopback-v0.12.1.tar.gz
+sha256	6d2c27a69d982bf39d7330b92f084fd0388beef486879320ccf263e4716cd549  v4l2loopback-v0.12.2.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 99879f9219..15c1ed6100 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = v0.12.1
+V4L2LOOPBACK_VERSION = v0.12.2
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
