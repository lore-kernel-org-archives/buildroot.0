From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 00:32:32 +0100
Subject: [Buildroot] [PATCH 12/84 RFC] package/gd: use 'menuconfig'
 instad of 'config'+'menu'
In-Reply-To: <2534a0b670dd2716d4881cf6130dbf9a7352a8e0.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <2534a0b670dd2716d4881cf6130dbf9a7352a8e0.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56846990.4070105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 In the subject: instad -> instead.

 Regards,
 Arnout

On 25-12-15 22:24, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/gd/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gd/Config.in b/package/gd/Config.in
> index e838635..1f466d2 100644
> --- a/package/gd/Config.in
> +++ b/package/gd/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_GD
> +menuconfig BR2_PACKAGE_GD
>  	bool "gd"
>  	help
>  	  GD is a graphics library. It allows your code to quickly
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_GD
>  
>  if BR2_PACKAGE_GD
>  
> -menu "gd tools"
> +comment "gd tools"
>  
>  config BR2_PACKAGE_GD_ANNOTATE
>  	bool "annotate"
> @@ -57,6 +57,4 @@ config BR2_PACKAGE_GD_WEBPNG
>  	bool "webpng"
>  	select BR2_PACKAGE_LIBPNG
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
