From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:01:18 +0200
Subject: [Buildroot] [git commit] grub2: really disable liblzma
Message-ID: <20160615210132.E6CE380E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b64f7b7eee12e24c70d65250f4c74b6d471ea85b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no option --enable-liblzma=no in grub2's configure script, so
the only way to disable liblzma support is to pass
ac_cv_lib_lzma_lzma_code=no.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: expand commit log, as suggested by Yann E. Morin.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/grub2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 88a46f4..112a401 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -62,7 +62,7 @@ GRUB2_CONF_OPTS = \
 	--with-platform=$(GRUB2_PLATFORM) \
 	--disable-grub-mkfont \
 	--enable-efiemu=no \
-	--enable-liblzma=no \
+	ac_cv_lib_lzma_lzma_code=no \
 	--enable-device-mapper=no \
 	--enable-libzfs=no \
 	--disable-werror
