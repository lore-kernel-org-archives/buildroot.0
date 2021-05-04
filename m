From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 21:17:23 +0200
Subject: [Buildroot] [git commit] package/kmod: support zstd compression if
 available
Message-ID: <20210504185025.B8383869A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df8d80ab5a6ab140c9d81cf81496919ed48e795a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kmod/kmod.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 7fed252c22..9d2b2c47d7 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -41,6 +41,13 @@ else
 KMOD_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+KMOD_DEPENDENCIES += zstd
+KMOD_CONF_OPTS += --with-zstd
+else
+KMOD_CONF_OPTS += --without-zstd
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 KMOD_DEPENDENCIES += xz
 KMOD_CONF_OPTS += --with-xz
