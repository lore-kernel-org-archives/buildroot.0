From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 08 Mar 2021 07:44:58 -0000
Subject: [Buildroot] [git commit] package/libxcrypt: --disable-werror to fix
 problem with sensitive compilers
Message-ID: <20210308072134.D50338896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65487297554e181218e872e858d558e1a21d2341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://autobuild.buildroot.net/results/e9a058a8c98daf197cd9d7ac632e0cb5707d524f

Some sensitive compilers may raise warnings that turn into errors.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxcrypt/libxcrypt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 63132edd9d..ccbb1a282c 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -11,4 +11,7 @@ LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
 LIBXCRYPT_INSTALL_STAGING = YES
 LIBXCRYPT_AUTORECONF = YES
 
+# Some warnings turn into errors with some sensitive compilers
+LIBXCRYPT_CONF_OPTS = --disable-werror
+
 $(eval $(autotools-package))
