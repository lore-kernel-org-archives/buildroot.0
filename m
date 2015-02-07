From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 10:01:14 +0100
Subject: [Buildroot] [git commit] x264: disable avxsynth support
Message-ID: <20150207090254.6233B80458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d471c19d0cedd2eda93ed686e9cf0399e5419919
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/0f8/0f8b1167ba23a9a2cd9bd6b6e1baa0470523d47d/
http://autobuild.buildroot.net/results/b65/b651f488fbd6f2985e1a656814098db6c60040e5/

We don't have an avxsynth package in Buildroot, and x264 uses dlopen to
access it so it breaks on static only toolchains.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 6352ba3..1e198bc 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -11,6 +11,7 @@ X264_LICENSE = GPLv2+
 X264_DEPENDENCIES = host-pkgconf
 X264_LICENSE_FILES = COPYING
 X264_INSTALL_STAGING = YES
+X264_CONF_OPTS = --disable-avs
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X264_DEPENDENCIES += host-yasm
