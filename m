From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Jan 2016 15:04:59 +0200
Subject: [Buildroot] [PATCH] moarvm: disable for sparc64
In-Reply-To: <20160117125808.GA7423@waldemar-brodkorb.de>
References: <20160117125808.GA7423@waldemar-brodkorb.de>
Message-ID: <20160117130459.GD10304@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Sun, Jan 17, 2016 at 01:58:08PM +0100, Waldemar Brodkorb wrote:
> Missing implementation of AO_fetch_compare_and_swap in
> libatomic_ops library for sparcv9.
> 
> Fixes following autobuilder issues:
> http://autobuild.buildroot.net/results/268e328e2d9ea951c0728ab6031d32e2b460d015/
> http://autobuild.buildroot.net/results/84847a9201244fce3e05e5e4e201f2e1848238de/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/moarvm/Config.in |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
> index 95f3752..bb1af7e 100644
> --- a/package/moarvm/Config.in
> +++ b/package/moarvm/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_MOARVM
>  	depends on !BR2_STATIC_LIBS # libuv
>  	depends on BR2_USE_MMU # libuv
>  	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # libatomic_ops
> +	# needs AO_fetch_compare_and_swap, not implemented for sparcv9
> +	depends on !BR2_sparc64

Please update the comment dependency as well.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
