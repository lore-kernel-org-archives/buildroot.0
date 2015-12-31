From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 01:08:54 +0100
Subject: [Buildroot] [PATCH 31/84 RFC] package/udpcast: use 'menuconfig'
 instad of 'config'+'menu'
In-Reply-To: <a268a17eef8f2d9e7b895fea1f8396dda8823987.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <a268a17eef8f2d9e7b895fea1f8396dda8823987.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56847216.8090904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:25, Yann E. MORIN wrote:
> This is a bit overkill, as there is only two sub-items. However, this
> commit is not about judging whether it makes sense or not to have a
> sub-menu, but to cleanup the 'config'+'menu' situation.

 Well, you could just as well take this opportunity to replace it with indented
config options. You wrote yourself in your cover text that 5 entries would be
the arbitrary cut-off.

 That said, it's acceptable to have this as an inbetween step as well.

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/udpcast/Config.in | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
> index 0424db7..a61829a 100644
> --- a/package/udpcast/Config.in
> +++ b/package/udpcast/Config.in
> @@ -2,7 +2,7 @@ comment "udpcast needs a toolchain w/ threads"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
>  
> -config BR2_PACKAGE_UDPCAST
> +menuconfig BR2_PACKAGE_UDPCAST
>  	bool "udpcast"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> @@ -14,8 +14,6 @@ config BR2_PACKAGE_UDPCAST
>  
>  if BR2_PACKAGE_UDPCAST
>  
> -menu "udpcast tools selection"
> -
>  config BR2_PACKAGE_UDPCAST_SENDER
>  	bool "sender"
>  	help
> @@ -26,6 +24,4 @@ config BR2_PACKAGE_UDPCAST_RECEIVER
>  	help
>  	  The udpcast receiver.
>  
> -endmenu
> -
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
