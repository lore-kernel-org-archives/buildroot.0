From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 02 Aug 2013 09:33:55 +0200
Subject: [Buildroot] [PATCH 3 of 4] crosstool-ng: remove unneed explicit
	ccache dependency
In-Reply-To: <patchbomb.1375428832@BEANTN0L019720>
References: <patchbomb.1375428832@BEANTN0L019720>
Message-ID: <f3b0ceb71ecc58d2eef4.1375428835@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ccache dependency was here to enforce build order.
It is not needed anymore.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
package/crosstool-ng/crosstool-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -11,7 +11,7 @@ CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
 
 HOST_CROSSTOOL_NG_DEPENDENCIES = \
-	$(if $(BR2_CCACHE),host-ccache) host-gawk \
+	host-gawk \
 	host-automake host-gperf host-bison host-flex \
 	host-texinfo
 
