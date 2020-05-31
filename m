From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2020 23:10:52 +0200
Subject: [Buildroot] [git commit branch/next] package/libcap-ng: add host
 variant
Message-ID: <20200531211622.5875D85F38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4cc1fc06523d37c5fca922d9127365089a795ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Qemu 5.0.0 recently switched to libcap-ng [1].
Add the host variant for host-qemu package.

[1] https://git.qemu.org/?p=qemu.git;a=commit;h=7e46261368d129c5ee8be927f5bcadc7ecd800d7

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcap-ng/libcap-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 0f29ef0972..102b472d1a 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -15,4 +15,8 @@ LIBCAP_NG_AUTORECONF = YES
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python
 
+HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
+HOST_LIBCAP_NG_CONF_OPTS = --without-python
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
