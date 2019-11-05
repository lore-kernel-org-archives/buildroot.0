From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2019 21:43:06 +0100
Subject: [Buildroot] [git commit] package/rauc: fix host build
Message-ID: <20191105203736.A72A08E835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e534e4336a4f4447f7f294dc52fe2d5d977e6f8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use --without-dbuspolicydir to fix build on host

Fixes:
 - http://autobuild.buildroot.org/results/1700950e682e48bdb99a0051af062f5db5997c6c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 451d3c898b..a49a580781 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -36,7 +36,11 @@ HOST_RAUC_DEPENDENCIES = \
 	host-libglib2 \
 	host-squashfs \
 	$(if $(BR2_PACKAGE_HOST_LIBP11),host-libp11)
-HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
+HOST_RAUC_CONF_OPTS += \
+	--disable-network \
+	--disable-json \
+	--disable-service \
+	--without-dbuspolicydir
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
