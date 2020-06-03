From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 3 Jun 2020 13:19:45 +0300
Subject: [Buildroot] [PATCH v2] package/edid-decode: bump version to
 1889504
In-Reply-To: <20200603101446.7589-1-ps.report@gmx.net>
References: <20200603101446.7589-1-ps.report@gmx.net>
Message-ID: <20200603101945.zu3uwm23vsweqzhm@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Jun 03, 2020 at 12:14:46PM +0200, Peter Seiderer wrote:
> - edid-decode changed from C to C++, adjust make command
>   accordingly and add BR2_INSTALL_LIBSTDCPP dependency
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - add BR2_INSTALL_LIBSTDCPP dependency (suggestd by Thomas Petazzoni)
> ---
>  package/edid-decode/Config.in        | 4 ++++
>  package/edid-decode/edid-decode.hash | 2 +-
>  package/edid-decode/edid-decode.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/edid-decode/Config.in b/package/edid-decode/Config.in
> index 701c70031f..d2d21288de 100644
> --- a/package/edid-decode/Config.in
> +++ b/package/edid-decode/Config.in
> @@ -1,6 +1,10 @@
>  config BR2_PACKAGE_EDID_DECODE
>  	bool "edid-decode"
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	help
>  	  Decode EDID data in human-readable format.
>  
>  	  https://git.linuxtv.org/edid-decode.git/
> +
> +comment "edid-decode needs a toolchain w/ C++"
> +	depends on !!BR2_INSTALL_LIBSTDCPP
> diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
> index e0a9c18523..f843aa68fd 100644
> --- a/package/edid-decode/edid-decode.hash
> +++ b/package/edid-decode/edid-decode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  27fcf4c8693ec6fe020b18c78c70ddba9a8b3ea8c55fcfad2a38103128ec5e36  edid-decode-6def7bc83dfb0338632e06a8b14c93faa6af8879.tar.gz
> +sha256  327fe14531ddebe74a730efc30209e68efbd86c11375b5576cbe23af3d691150  edid-decode-188950472c19492547e298b27f9da0d72cf826df.tar.gz
>  sha256  4b4a7e6d7c358bb5b982eaa84d228cd9e99b75a5fefd3af01272957bf2016b5b  edid-decode.c

This file is gone in the revision you bump to. There is now a LICENSE file 
that we should be using instead.

baruch

> diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
> index c43f1ae7da..e15cb70f84 100644
> --- a/package/edid-decode/edid-decode.mk
> +++ b/package/edid-decode/edid-decode.mk
> @@ -4,14 +4,14 @@
>  #
>  ################################################################################
>  
> -EDID_DECODE_VERSION = 6def7bc83dfb0338632e06a8b14c93faa6af8879
> +EDID_DECODE_VERSION = 188950472c19492547e298b27f9da0d72cf826df
>  EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
>  EDID_DECODE_LICENSE = MIT
>  EDID_DECODE_LICENSE_FILES = edid-decode.c
>  
>  define EDID_DECODE_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
> +		CXX="$(TARGET_CXX) $(TARGET_CXXFLAGS) $(TARGET_LDFLAGS)"
>  endef
>  
>  define EDID_DECODE_INSTALL_TARGET_CMDS
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
