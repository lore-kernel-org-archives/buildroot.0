From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 19:53:42 +0100
Subject: [Buildroot] [git commit] package/icu: add CPE variables
Message-ID: <20210304183428.D67FD81370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cb2f4fd3aacf66873d243fd53b8658cc308f9d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:icu-project:international_components_for_unicode is a valid
CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aicu-project%3Ainternational_components_for_unicode

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/icu/icu.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 8d0288578c..4d67831c76 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -13,6 +13,9 @@ ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
 ICU_LICENSE = ICU License
 ICU_LICENSE_FILES = LICENSE
+ICU_CPE_ID_VENDOR = icu-project
+ICU_CPE_ID_PRODUCT = international_components_for_unicode
+ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
 
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
