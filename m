From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 22:42:35 +0200
Subject: [Buildroot] [git commit] libcap-ng: explicit disable python bindings
Message-ID: <20120405204350.4BDDD90343@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ee4614c4e72dfab4e8f36186fc8ef4ab05fb9a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python bindings use swig, which we don't have in buildroot (but might be
installed on the host), so disable it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcap-ng/libcap-ng.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 6ea5de4..4a52702 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -8,5 +8,7 @@ LIBCAP_NG_VERSION = 0.6.6
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng/
 LIBCAP_NG_SOURCE = libcap-ng-$(LIBCAP_NG_VERSION).tar.gz
 LIBCAP_NG_INSTALL_STAGING = YES
+LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
+LIBCAP_NG_CONF_OPT = --without-python
 
 $(eval $(call AUTOTARGETS))
