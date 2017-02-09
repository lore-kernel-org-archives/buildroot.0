From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 23:24:59 +0100
Subject: [Buildroot] [git commit] lxc: bump to version 2.0.7
Message-ID: <20170209222503.CCD34821E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d07ad7f399ad53d230787f2347e3dffb43641a07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/lxc.hash | 3 +--
 package/lxc/lxc.mk   | 8 +-------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 8fb4dc0..f80c88d 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256	7c292cd0055dac1a0e6fbb6a7740fd12b6ffb204603c198faf37c11c9d6dcd7a	lxc-2.0.6.tar.gz
-sha256	e8ca30fb1e8d6dbafb5cccc04b3fd1784c35bc8ccf79112036e5166924b6b01d	64fa248372c90c9d98fc9d67f80327d865c11a48.patch
+sha256	1c09c075f06ec029f86fa6370c7d379494ff4c66a129eda17af7b7b41e055f5d	lxc-2.0.7.tar.gz
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index d803916..455814b 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,18 +4,12 @@
 #
 ################################################################################
 
-LXC_VERSION = 2.0.6
+LXC_VERSION = 2.0.7
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
 LXC_INSTALL_STAGING = YES
-# we're patching configure.ac
-LXC_AUTORECONF = YES
-
-# This patch adds --enable-gnutls option
-LXC_PATCH = \
-	https://github.com/lxc/lxc/commit/64fa248372c90c9d98fc9d67f80327d865c11a48.patch
 
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-python --disable-werror \
