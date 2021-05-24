From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 10:49:36 +0200
Subject: [Buildroot] [git commit] package/python-pillow: add webpmux support
Message-ID: <20210524082154.321AA86497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1f3e99f0e518d14a271fcc2f509f99bc032702d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

webpmux is an optional dependency since version 2.2.0 and
https://github.com/python-pillow/Pillow/commit/b4735f7829bb88c99071cd91b208aa6ffd2cba24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: move into existing webp conditional block]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pillow/python-pillow.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index ab52f38df1..fd0c6ce862 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -59,8 +59,13 @@ endif
 ifeq ($(BR2_PACKAGE_WEBP),y)
 PYTHON_PILLOW_DEPENDENCIES += webp
 PYTHON_PILLOW_BUILD_OPTS += --enable-webp
+ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
+PYTHON_PILLOW_BUILD_OPTS += --enable-webpmux
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-webp
+PYTHON_PILLOW_BUILD_OPTS += --disable-webpmux
+endif
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
 endif
 
 define PYTHON_PILLOW_BUILD_CMDS
