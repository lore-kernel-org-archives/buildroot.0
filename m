From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 16:59:21 +0200
Subject: [Buildroot] [git commit] weston: handle optional libva support
Message-ID: <20160330150133.580B17FCDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d4fc5f908ebd7304f6c2547a7c8da7a8d241483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's used for the recorder.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index d600bc3..08c6337 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -75,4 +75,11 @@ else
 WESTON_CONF_OPTS += --disable-rpi-compositor
 endif # BR2_PACKAGE_WESTON_RPI
 
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+WESTON_CONF_OPTS += --enable-vaapi-recorder
+WESTON_DEPENDENIES += libva
+else
+WESTON_CONF_OPTS += --disable-vaapi-recorder
+endif
+
 $(eval $(autotools-package))
