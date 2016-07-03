From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:56:06 +0200
Subject: [Buildroot] [git commit] mke2img: remove SOURCE
Message-ID: <20160703111558.EA156820F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49202b307fedff399a0dc2250e000b55de633f88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the mke2img package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mke2img/mke2img.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
index 04aaa8f..9de387a 100644
--- a/package/mke2img/mke2img.mk
+++ b/package/mke2img/mke2img.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-HOST_MKE2IMG_SOURCE =
 HOST_MKE2IMG_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
 define HOST_MKE2IMG_INSTALL_CMDS
