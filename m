From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 00:48:47 +0100
Subject: [Buildroot] [PATCH 18/84 RFC] package/ncftp: use 'menuconfig'
 instad of 'config'+'menu'
In-Reply-To: <b86fde686f1e225f3fe4ec4fac5e8980a346bede.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <b86fde686f1e225f3fe4ec4fac5e8980a346bede.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56846D5F.2030405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:24, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/ncftp/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
> index 57586e7..736bea5 100644
> --- a/package/ncftp/Config.in
> +++ b/package/ncftp/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_NCFTP
> +menuconfig BR2_PACKAGE_NCFTP
>  	bool "ncftp"
>  	# fork()
>  	depends on BR2_USE_MMU
> @@ -10,7 +10,7 @@ config BR2_PACKAGE_NCFTP
>  
>  if BR2_PACKAGE_NCFTP
>  
> -menu "ncFTP tools selection"
> +comment "tools selection"

 Comment not needed.

 Regards,
 Arnout

>  
>  config BR2_PACKAGE_NCFTP_GET
>  	bool "NcFTPGet - command-line utility program"
> @@ -32,6 +32,4 @@ config BR2_PACKAGE_NCFTP_BOOKMARKS
>  	bool "NcFTPBookmarks - ncurses based Bookmark Editor"
>  	select BR2_PACKAGE_NCURSES
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
