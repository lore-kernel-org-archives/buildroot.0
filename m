From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:52:04 +0200
Subject: [Buildroot] [git commit] makedevs: remove VERSION/SOURCE
Message-ID: <20160703111557.6AF9F8015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6268be239aaa747a411425a969b99f42e03ece6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the VERSION and
SOURCE variables in the makedevs package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedevs/makedevs.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 130f5bc..95933c4 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -4,11 +4,6 @@
 #
 ################################################################################
 
-# source included in buildroot
-MAKEDEVS_SOURCE =
-HOST_MAKEDEVS_SOURCE =
-
-MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
 MAKEDEVS_LICENSE = GPLv2
 
 HOST_MAKEDEVS_CFLAGS = $(HOST_CFLAGS)
