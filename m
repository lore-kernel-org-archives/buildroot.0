From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:13:47 +0100
Subject: [Buildroot] [git commit] package/cpio: Fix GNU Mirror Path
Message-ID: <20170206181456.4355B81DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f3627a91fd97ee9442755403e2864cd32994f6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replacing ftpmirror.gnu.org with BR2_GNU_MIRROR variable

Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cpio/cpio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 1576127..b0b8fa6 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CPIO_VERSION = 2.12
-CPIO_SITE = http://ftp.gnu.org/gnu/cpio
+CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
 CPIO_CONF_OPTS = --bindir=/bin
 CPIO_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 CPIO_LICENSE = GPLv3+
