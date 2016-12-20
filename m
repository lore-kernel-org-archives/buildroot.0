From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:28 +0100
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
	information to libtool
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-12-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libtool include support for cross-compilation since v1.5. In order to enable it,
we have to pass `--with-sysroot' to `configure' script. With this option,
autoconf fill `$lt_sysroot' and libtool will search libraries in `$lt_sysroot'
subtree.

Note Yocto force `$lt_sysroot' even if --with-sysroot is not provided:
  http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/pkg-autotools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index f7b8488..bb20eec 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -192,6 +192,7 @@ define $(2)_CONFIGURE_CMDS
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--program-prefix="" \
+		--with-sysroot \
 		--disable-gtk-doc \
 		--disable-gtk-doc-html \
 		--disable-doc \
-- 
1.9.1
