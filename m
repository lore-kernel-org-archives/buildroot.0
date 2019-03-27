From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Mar 2019 18:47:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: BFD protocol needs threads
In-Reply-To: <20190327164059.24223-1-fontaine.fabrice@gmail.com>
References: <20190327164059.24223-1-fontaine.fabrice@gmail.com>
Message-ID: <20190327164713.qgjxfmne77hrmxua@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Wed, Mar 27, 2019 at 05:40:59PM +0100, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/e1f879cb34f9cfbbd14b75f63d25897c5bee53cd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bird/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/bird/Config.in b/package/bird/Config.in
> index 63170ee470..bb5fbf92d5 100644
> --- a/package/bird/Config.in
> +++ b/package/bird/Config.in
> @@ -29,9 +29,13 @@ config BR2_PACKAGE_BIRD_BABEL
>  
>  config BR2_PACKAGE_BIRD_BFD
>  	bool "bfd"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  Enable BFD protocol.
>  
> +comment "BFD protocol needs threads"

We usually use the language "X needs a toolchain w/ threads".

baruch

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_BIRD_BGP
>  	bool "bgp"
>  	default y

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
