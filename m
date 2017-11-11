From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:24:53 +0100
Subject: [Buildroot] [git commit] package/openjpeg: fix build with threads
 disabled
Message-ID: <20171111221732.9E52880166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6facc809b01e1c7b02bb93ede4a4bff7b91a091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/f16/f16a558c30199a92e93a31e0ba391b99a9bd689f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openjpeg/openjpeg.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index df85168..9a8fdab 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -15,4 +15,10 @@ OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LCMS2),lcms2)
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+OPENJPEG_CONF_OPTS += -DOPJ_USE_THREAD=ON
+else
+OPENJPEG_CONF_OPTS += -DOPJ_USE_THREAD=OFF
+endif
+
 $(eval $(cmake-package))
