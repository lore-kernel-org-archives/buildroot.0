From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:35:30 +0100
Subject: [Buildroot] [git commit] package/libupnp: set LIBUPNP_CPE_ID_VALID
Message-ID: <20210111201744.22AA4864D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a8ec1f9a780bbc4c639c287d090a21d7b795f07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libupnp_project:libupnp is indeed the right CPE identifier
for this package, as can be seen from:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibupnp_project%3Alibupnp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libupnp/libupnp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 8831885ba4..b7836590c2 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -11,5 +11,6 @@ LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3-Clause
 LIBUPNP_LICENSE_FILES = LICENSE
+LIBUPNP_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
