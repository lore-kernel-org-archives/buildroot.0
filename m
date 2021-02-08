From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Feb 2021 22:13:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: add CPE variables
In-Reply-To: <20210208200825.383796-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 8 Feb 2021 21:08:25 +0100")
References: <20210208200825.383796-1-fontaine.fabrice@gmail.com>
Message-ID: <874kims1of.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:bluez:bluez is a valid CPE identifier for this package:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abluez%3Abluez

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 ++
 >  package/bluez5_utils/bluez5_utils.mk                 | 2 ++
 >  2 files changed, 4 insertions(+)

 > diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
 > index 589978c8c5..a2e22148ae 100644
 > --- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
 > +++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
 > @@ -11,6 +11,8 @@ BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 >  BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
 >  BLUEZ5_UTILS_HEADERS_LICENSE = GPL-2.0+, LGPL-2.1+
 >  BLUEZ5_UTILS_HEADERS_LICENSE_FILES = COPYING COPYING.LIB
 > +BLUEZ5_UTILS_HEADERS_CPE_ID_VENDOR = bluez
 > +BLUEZ5_UTILS_HEADERS_CPE_ID_PRODUCT = bluez
 
 >  BLUEZ5_UTILS_HEADERS_INSTALL_STAGING = YES
 >  BLUEZ5_UTILS_HEADERS_INSTALL_TARGET = NO
 > diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
 > index 6596516850..803bc9fea3 100644
 > --- a/package/bluez5_utils/bluez5_utils.mk
 > +++ b/package/bluez5_utils/bluez5_utils.mk
 > @@ -11,6 +11,8 @@ BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 >  BLUEZ5_UTILS_INSTALL_STAGING = YES
 >  BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 >  BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 > +BLUEZ5_CPE_ID_VENDOR = bluez
 > +BLUEZ5_CPE_ID_PRODUCT = bluez

.. after fixing BLUEZ5_CPE to BLUEZ5_UTILS_CPE.

-- 
Bye, Peter Korsgaard
