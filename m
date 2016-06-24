From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 17:32:05 -0400
Subject: [Buildroot] [PATCH 3/7] Add host-libcap-ng capabilities.
In-Reply-To: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
References: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466803929-5513-3-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-libcap-ng can be a requirement for host-audit.  This allows libcap-ng to be compiled as a host package.

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
