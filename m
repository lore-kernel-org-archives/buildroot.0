From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 19:21:16 +0100
Subject: [Buildroot] [PATCH 2/4] blackfin: 2012R2 toolchain is gone,
 remove kludges
In-Reply-To: <1443890749-27092-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443890749-27092-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443890749-27092-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <56101C9C.3020700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 17:45, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/dhcpcd/Config.in   | 2 --
>  package/glog/Config.in     | 2 --
>  package/libtirpc/Config.in | 2 --
>  package/openpgm/Config.in  | 1 -
>  package/rpcbind/Config.in  | 4 ----
>  package/zeromq/Config.in   | 1 -
>  package/zyre/Config.in     | 4 ----
>  7 files changed, 16 deletions(-)
> 
[snip]
> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> index a8e6dd3..227dd9d 100644
> --- a/package/libtirpc/Config.in
> +++ b/package/libtirpc/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBTIRPC
>  	# don't need to propagate this dependency to reverse
>  	# dependencies of libtirpc for which native RPC support can be
>  	# used instead of libtirpc.
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2

 The first part of the comment above can be removed as well.


 Regards,
 Arnout

>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  Libtirpc is a port of Sun's Transport-Independent RPC
> @@ -14,5 +13,4 @@ config BR2_PACKAGE_LIBTIRPC
>  	  http://sourceforge.net/projects/libtirpc/
>  
>  comment "libtirpc needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
