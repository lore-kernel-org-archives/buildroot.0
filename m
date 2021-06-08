From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 10:25:02 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-pillow:
 add webpmux support
Message-ID: <20210608075704.EACC47FE1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1f5ffc326dcd18f3ced85bc5b59d237f8b28ac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

webpmux is an optional dependency since version 2.2.0 and
https://github.com/python-pillow/Pillow/commit/b4735f7829bb88c99071cd91b208aa6ffd2cba24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: move into existing webp conditional block]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a1f3e99f0e518d14a271fcc2f509f99bc032702d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
