From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 3 Sep 2019 12:14:28 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/libnss: security bump to
 version 3.46
In-Reply-To: <20190903101216.20337-2-giulio.benetti@micronovasrl.com>
References: <20190903101216.20337-1-giulio.benetti@micronovasrl.com>
 <20190903101216.20337-2-giulio.benetti@micronovasrl.com>
Message-ID: <7c46e7aa-79d7-ffa0-4b24-adaf329a45c3@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to mention:
V1->V2:
* reworded commit log with CVE and note about previous patch that bumps 
nspr version to 4.22 that is required by nss 3.46

Il 03/09/2019 12:12, Giulio Benetti ha scritto:
> Fixes the following security issues:
> 
> (3.44.1)
> CVE-2019-11729: More thorough input checking
> CVE-2019-11719: Don't unnecessarily strip leading 0's from key material
> during PKCS11 import
> CVE-2019-11727: Prohibit use of RSASSA-PKCS1-v1_5 algorithms in TLS 1.3
> 
> Note:
> This version requires nspr 4.22 or newer provided by the previous patch.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   package/libnss/libnss.hash | 2 +-
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 1d600f14ef..678f39b090 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
>   # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_42_1_RTM/src/SHA256SUMS
> -sha256	087db37d38fd49dfd584dd2a8b5baa7fc88de7c9bd97c0c2d5be4abcafc61fc6  nss-3.42.1.tar.gz
> +sha256	6b699649d285602ba258a4b0957cb841eafc94eff5735a9da8da0adbb9a10cef  nss-3.46.tar.gz
>   # Locally calculated
>   sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 34e9d41968..776f232ad5 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.42.1
> +LIBNSS_VERSION = 3.46
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
> 

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
