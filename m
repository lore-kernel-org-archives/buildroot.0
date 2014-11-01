From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 21:46:33 +0100
Subject: [Buildroot] [git commit] lxc: bump version
Message-ID: <20141101204721.82AD8B2BA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5213d1d5834e88ef064beae46f15b4312ed574c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: switch back to a tarball from
https://linuxcontainers.org/downloads/ instead of
github. Unfortunately, even though the tarball has the configure
script generated, we still need to autoreconf since we're patching
configure.ac.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/lxc.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 38bda7e..69c2fb9 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LXC_VERSION = 1.0.4
-LXC_SITE = $(call github,lxc,lxc,lxc-$(LXC_VERSION))
+LXC_VERSION = 1.0.6
+LXC_SITE = https://linuxcontainers.org/downloads/
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
-# configure not shipped
+# we're patching configure.ac
 LXC_AUTORECONF = YES
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-lua --disable-python \
