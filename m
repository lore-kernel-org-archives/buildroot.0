From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Oct 2013 10:44:27 +0300
Subject: [Buildroot] [PATCH 2/2] protobuf-c: needs thread support
In-Reply-To: <1381389916.8952.2.camel@phoenix>
References: <1381389798.8952.0.camel@phoenix> <1381389916.8952.2.camel@phoenix>
Message-ID: <20131010074427.GA4875@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Axel,

On Thu, Oct 10, 2013 at 03:25:16PM +0800, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  package/protobuf-c/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
> index 9aff6e2..17cc8f1 100644
> --- a/package/protobuf-c/Config.in
> +++ b/package/protobuf-c/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PROTOBUF_C
>  	bool "protobuf-c"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf

This should be squashed into the previous patch. Although strictly speaking 
bisectability is not broken by the previous patch (build without threads is 
broken already), it is nicer IMO.

baruch

>  	select BR2_PACKAGE_PROTOBUF
>  	help
>  	  Code generator and runtime libraries to use Protocol Buffers
> @@ -8,5 +9,5 @@ config BR2_PACKAGE_PROTOBUF_C
>  
>  	  http://code.google.com/p/protobuf-c/
>  
> -comment "protobuf-c requires a toolchain with C++ support enabled"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +comment "protobuf-c requires a toolchain with C++ and thread support"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
