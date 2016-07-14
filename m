From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 14 Jul 2016 13:47:02 -0400
Subject: [Buildroot] [PATCH 2/4] libcap-ng: Allow host compilation.
In-Reply-To: <1468518424-11785-1-git-send-email-Aduskett@gmail.com>
References: <1468518424-11785-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1468518424-11785-2-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Audit may require libcap-ng as  a dependency, this allows
libcap-ng to compile as a host package.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libcap-ng/libcap-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index d78f5dc..543cbe6 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -13,4 +13,8 @@ LIBCAP_NG_INSTALL_STAGING = YES
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python
 
+HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
+HOST_LIBCAP_NG_CONF_OPTS = --without-python
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
