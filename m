From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 20:04:26 +0100
Subject: [Buildroot] [git commit] package/libminiupnpc: add CPE variables
Message-ID: <20210304184728.9EE538379C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9fbb8dccb0432dcca87dca10ebba3961b98896b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:miniupnp_project:miniupnpc is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminiupnp_project%3Aminiupnpc

Split the _VERSION into the traditional major/minor separation, even
though it is not strictly speaking major/minor. This allows re-using for
the CPE versioning.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - inverse the split: rather than defining _VERSION based on the CPE
    values, split the _VERSION and use that to define the CPE variables
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libminiupnpc/libminiupnpc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 50b3c6604c..551a6767cf 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,11 +4,17 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.1.20201016
+LIBMINIUPNPC_VERSION_MAJOR = 2.1
+LIBMINIUPNPC_VERSION_MINOR = 20201016
+LIBMINIUPNPC_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR).$(LIBMINIUPNPC_VERSION_MINOR)
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
 LIBMINIUPNPC_LICENSE = BSD-3-Clause
 LIBMINIUPNPC_LICENSE_FILES = LICENSE
+LIBMINIUPNPC_CPE_ID_VENDOR = miniupnp_project
+LIBMINIUPNPC_CPE_ID_PRODUCT = miniupnpc
+LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
+LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)
 
 $(eval $(cmake-package))
