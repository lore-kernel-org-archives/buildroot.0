From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 22:40:53 +0100
Subject: [Buildroot] [PATCH 1/1] php-fpm: remove config comments to fix
 startup
In-Reply-To: <1478634582-15683-1-git-send-email-fhunleth@troodon-software.com>
References: <1478634582-15683-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <0c89f1a3-3d37-2271-9b02-69f7c1116698@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 20:49, Frank Hunleth wrote:
> The comments in the Buildroot-provided php-fpm.conf would produce the
> following error when starting php-fpm:
> 
> ERROR: [/etc/php-fpm.conf:2] value is NULL for a ZEND_INI_PARSER_ENTRY
> 
> Removing the comments fixes the problem.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/php/php-fpm.conf | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/php/php-fpm.conf b/package/php/php-fpm.conf
> index b75a58f..88014b8 100644
> --- a/package/php/php-fpm.conf
> +++ b/package/php/php-fpm.conf
> @@ -1,9 +1,6 @@
>  [www]
> -# Only start children when there are requests to be processed
>  pm = ondemand
> -# Terminate them again after there haven't been any for 2 minutes
>  pm.process_idle_timeout = 120s
> -# Maximum number of children processing PHP requests concurrently
>  pm.max_children = 5
>  
>  listen = /var/run/php-fpm.sock
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
