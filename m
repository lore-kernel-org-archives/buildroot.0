From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Tue, 2 Dec 2014 11:40:43 +0100
Subject: [Buildroot] [PATCH] exiv2: XMP support needs largefile
In-Reply-To: <bed23382a22ff4672c36ac53805589eaef4399b1.1417466526.git.baruch@tkos.co.il>
References: <bed23382a22ff4672c36ac53805589eaef4399b1.1417466526.git.baruch@tkos.co.il>
Message-ID: <20141202114043.406039d5@nserafini-N550JK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 Dec 2014 22:42:06 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> XMP code enables largefile unconditionally.
> 
> Fixes:
> http://autobuild.buildroot.net/results/116/1166068a64733d22a2f891849177ad826347dc9f/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/exiv2/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
> index 3dc74459a78c..b2e2ac83d095 100644
> --- a/package/exiv2/Config.in
> +++ b/package/exiv2/Config.in
> @@ -39,11 +39,12 @@ config BR2_PACKAGE_EXIV2_XMP
>  	bool "XMP support"
>  	select BR2_PACKAGE_EXPAT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_LARGEFILE
>  	help
>  	  Build with XMP support
>  
> -comment "xmp support needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "xmp support needs a toolchain w/ threads, and largefile"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
>  
>  config BR2_PACKAGE_EXIV2_LENSDATA
>  	bool "Nikon lens name database"
Tested-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

Tested with the config from 116/1166068a without largefile and
with my config ARM arch, external toolchain Linaro
ARM 2014.08 with largefile.

Regards,
Nicolas

-- 
Nicolas Serafini
R&D Embedded Software Engineer

www.sensefly.com
Route de Gen?ve 38
1033 Cheseaux-Lausanne
Switzerland
