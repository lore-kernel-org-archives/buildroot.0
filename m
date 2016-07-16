From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 16 Jul 2016 16:06:25 -0400
Subject: [Buildroot] [v2 1/5] package/libcap-ng: add support for host variant
Message-ID: <1468699589-14328-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

refpolicy requires several packages to be compiled as a host variant.
The following list is in order of required packages:

refpolicy
host-policycoreutils
host-libsemanage
host-audit
host-libcap-ng

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes:

v1 - v2:
 - Changed patch order

 package/libcap-ng/libcap-ng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index d78f5dc..fae6346 100644
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
