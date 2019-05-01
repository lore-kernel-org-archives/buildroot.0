From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 14:46:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/libzip: add host variant
In-Reply-To: <20190430201121.15634-1-joerg.krause@embedded.rocks>
References: <20190430201121.15634-1-joerg.krause@embedded.rocks>
Message-ID: <1610a93c-b451-4eea-a956-359e0752843f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/04/2019 22:11, J?rg Krause wrote:
> The updated host mfgtool package needs the host variant of libzip.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

 Applied to master, thanks.

 I marked them mfgtools bump itself as changes requested, so if you choose to
ignore my comments (or it doesn't work), please resubmit that one.

 Regards,
 Arnout

> ---
>  package/libzip/libzip.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
> index b90ea76f5e..280ca6d8c7 100644
> --- a/package/libzip/libzip.mk
> +++ b/package/libzip/libzip.mk
> @@ -11,6 +11,7 @@ LIBZIP_LICENSE = BSD-3-Clause
>  LIBZIP_LICENSE_FILES = LICENSE
>  LIBZIP_INSTALL_STAGING = YES
>  LIBZIP_DEPENDENCIES = zlib
> +HOST_LIBZIP_DEPENDENCIES = host-zlib
>  
>  ifeq ($(BR2_PACKAGE_BZIP2),y)
>  LIBZIP_DEPENDENCIES += bzip2
> @@ -33,3 +34,4 @@ LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=OFF
>  endif
>  
>  $(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> 
