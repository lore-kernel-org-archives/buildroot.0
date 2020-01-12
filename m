From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:45:21 +0100
Subject: [Buildroot] [git commit] package/libsigrok: add optional hidapi
 dependency
Message-ID: <20200112214502.A286B814CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c86ea196363a277267c034bda5edc80896a6118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hidapi dependency has been added since version 0.5.2 and
https://github.com/sigrokproject/libsigrok/commit/4417074c68ce998c2d666fc8a034204a1b74fc2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsigrok/libsigrok.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 4866ec4d68..8def692e31 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -22,6 +22,13 @@ else
 LIBSIGROK_CONF_OPTS += --without-libbluez
 endif
 
+ifeq ($(BR2_PACKAGE_HIDAPI),y)
+LIBSIGROK_CONF_OPTS += --with-libhidapi
+LIBSIGROK_DEPENDENCIES += hidapi
+else
+LIBSIGROK_CONF_OPTS += --without-libhidapi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
 LIBSIGROK_CONF_OPTS += --with-libserialport
 LIBSIGROK_DEPENDENCIES += libserialport
