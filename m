From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 21:17:24 +0200
Subject: [Buildroot] [git commit] package/kmod: create zstd option for host
Message-ID: <20210504185025.C71B3812A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee66864bcf2f23e87faabd38dfa1b9d1a20274a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kmod/Config.in.host | 3 +++
 package/kmod/kmod.mk        | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/package/kmod/Config.in.host b/package/kmod/Config.in.host
index 9dbbcea782..7680cecdb2 100644
--- a/package/kmod/Config.in.host
+++ b/package/kmod/Config.in.host
@@ -10,6 +10,9 @@ if BR2_PACKAGE_HOST_KMOD
 config BR2_PACKAGE_HOST_KMOD_GZ
 	bool "support gzip-compressed modules"
 
+config BR2_PACKAGE_HOST_KMOD_ZSTD
+	bool "support zstd-compressed modules"
+
 config BR2_PACKAGE_HOST_KMOD_XZ
 	bool "support xz-compressed modules"
 
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 9d2b2c47d7..7c5d200b0f 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -98,6 +98,13 @@ else
 HOST_KMOD_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_KMOD_ZSTD),y)
+HOST_KMOD_DEPENDENCIES += host-zstd
+HOST_KMOD_CONF_OPTS += --with-zstd
+else
+HOST_KMOD_CONF_OPTS += --without-zstd
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_KMOD_XZ),y)
 HOST_KMOD_DEPENDENCIES += host-xz
 HOST_KMOD_CONF_OPTS += --with-xz
