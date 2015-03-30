From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Mar 2015 19:59:34 +0300
Subject: [Buildroot] [PATCH 1/1] gnuradio: depends on shared libs
In-Reply-To: <1427737015-12068-1-git-send-email-gwenj@trabucayre.com>
References: <1427737015-12068-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150330165934.GJ12479@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gwenhael Goavec-Merou,

On Mon, Mar 30, 2015 at 07:36:55PM +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> volk must be compiled with toolchain built with shared lib to avoid :
> attempted static link of dynamic object `../lib/libvolk.so.0.0.0'
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gnuradio/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 274afaa..bdf701c 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -1,5 +1,6 @@
> -comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, largefile, wchar"
> +comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, largefile, wchar and shared libs"
>  	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_LARGEFILE || \
>  		!BR2_INET_IPV6

Should add '|| BR2_STATIC_LIBS' to this list of ORed dependencies to get the 
intended behaviour. Otherwise the comment will not be shown when 
!BR2_STATIC_LIBS.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
