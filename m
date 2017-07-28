From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:38:06 +0200
Subject: [Buildroot] [PATCH 1/1] libpng: bump version to 1.6.31
In-Reply-To: <20170728115949.8204-1-aduskett@gmail.com>
References: <20170728115949.8204-1-aduskett@gmail.com>
Message-ID: <75cfd5f4-14da-a768-24f0-a2e7d6fcad20@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-07-17 13:59, Adam Duskett wrote:
> sourceforge doesn't host the latest version and doesn't seem
> to be updated.  Change the URL to osl.osuosl.org, which does
> host the latest version.

 This is really no good, because apparently the osuosl.org location only stores
the latest release.

 The .31 release is also not mentioned on the home page.

 Since this release is very fresh, perhaps wait a couple of days until it is
there? And perhaps notify upstream of this discrepancy?

 Actually... apparently it has appeared on sourceforge now...

 Can you respin?

> 
> While we are at it, add a hash for the License file.

[snip]
> diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
> index 279420a70..65efaa128 100644
> --- a/package/libpng/libpng.hash
> +++ b/package/libpng/libpng.hash
> @@ -1,4 +1,5 @@
> -# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.29/
> -sha1 7dbe6a5088b938545fc0857c507d4e0cf5d9023e  libpng-1.6.29.tar.xz

 Please keep the sourceforge sha1: de695064363df331734466981ef7f6546ef516bf

 Regards,
 Arnout

>  # Locally computed:
> -sha256 4245b684e8fe829ebb76186327bb37ce5a639938b219882b53d64bd3cfc5f239  libpng-1.6.29.tar.xz
> +sha256 232a602de04916b2b5ce6f901829caf419519e6a16cc9cd7c1c91187d3ee8b41  libpng-1.6.31.tar.xz
> +
> +# License file
> +sha256 434a58adb33d5a3af601ee74e444eaf4bad89453d55c42965a3270e988d71745  LICENSE
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index c82c4efff..d84d4833b 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -LIBPNG_VERSION = 1.6.29
> +LIBPNG_VERSION = 1.6.31
>  LIBPNG_SERIES = 16
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
> -LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
> +LIBPNG_SITE = https://ftp-osl.osuosl.org/pub/libpng/src/libpng${LIBPNG_SERIES}
>  LIBPNG_LICENSE = Libpng
>  LIBPNG_LICENSE_FILES = LICENSE
>  LIBPNG_INSTALL_STAGING = YES
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
