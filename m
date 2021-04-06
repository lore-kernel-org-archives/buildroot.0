From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Apr 2021 22:36:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libupnp: security bump to
 version 1.14.5
In-Reply-To: <20210406183927.1268381-1-fontaine.fabrice@gmail.com>
References: <20210406183927.1268381-1-fontaine.fabrice@gmail.com>
Message-ID: <e89191bc-68b3-0e4d-ce68-db9be183aa3f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/04/2021 20:39, Fabrice Fontaine wrote:
> Non-recursive version of ixmlNode_free() avoids stack overflow
> attack. Fixes CVE-2021-28302.
> 
> https://github.com/pupnp/pupnp/blob/release-1.14.5/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libupnp/libupnp.hash | 2 +-
>  package/libupnp/libupnp.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
> index 6b16eff3c8..8923d46f5f 100644
> --- a/package/libupnp/libupnp.hash
> +++ b/package/libupnp/libupnp.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  ecb23d4291968c8a7bdd4eb16fc2250dbacc16b354345a13342d67f571d35ceb  libupnp-1.14.0.tar.bz2
> +sha256  227ffa407be6b91d4e42abee1dd27e4b8d7e5ba8d3d45394cca4e1eadc65149a  libupnp-1.14.5.tar.bz2
>  sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
> diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
> index 8250d30ca0..f79d169dc8 100644
> --- a/package/libupnp/libupnp.mk
> +++ b/package/libupnp/libupnp.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -LIBUPNP_VERSION = 1.14.0
> +LIBUPNP_VERSION = 1.14.5
>  LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
>  LIBUPNP_SITE = \
> -	http://downloads.sourceforge.net/project/pupnp/pupnp/libupnp-$(LIBUPNP_VERSION)
> +	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
>  LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
>  LIBUPNP_INSTALL_STAGING = YES
>  LIBUPNP_LICENSE = BSD-3-Clause
> 
