From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 09:26:58 +0100
Subject: [Buildroot] [git commit] glibc: install the obsolete libnsl
Message-ID: <20180319082729.800C7837A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=398747f5fafca8c07e696612d8eded53d4f935c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc 2.27 stopped installing libnsl by default. Restore libnsl install
to fix packages, like exim, that use that library.

Fixes (exim):
http://autobuild.buildroot.net/results/a19/a19df43be7d27cf8815e1257122d25aa8285d75b/
http://autobuild.buildroot.net/results/8ec/8ecfc42a81efec8485784f945e231eb40a087b5b/
http://autobuild.buildroot.net/results/054/054eb702a9b8c66454970333ef45a0afccb7cc80/

Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 00e114566c..f724ced857 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -100,6 +100,7 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-profile \
 		--without-gd \
 		--enable-obsolete-rpc \
+		--enable-obsolete-nsl \
 		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
 		--with-headers=$(STAGING_DIR)/usr/include)
 	$(GLIBC_ADD_MISSING_STUB_H)
