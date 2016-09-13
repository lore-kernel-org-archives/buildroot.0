From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Sep 2016 08:40:23 +0200
Subject: [Buildroot] [PATCH 3/3] package/nginx-naxsi: add missing pcre
 dependency
In-Reply-To: <20160912192324.23682-3-s.martin49@gmail.com>
References: <20160912192324.23682-1-s.martin49@gmail.com>
 <20160912192324.23682-3-s.martin49@gmail.com>
Message-ID: <ce6702df-b7fe-dc20-87cd-366bec948482@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-09-16 21:23, Samuel Martin wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/9c7/9c7bad6831b09251af81e2bbfc595a241df87c70/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/nginx-naxsi/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
> index 2f7c2da..6c175eb 100644
> --- a/package/nginx-naxsi/Config.in
> +++ b/package/nginx-naxsi/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_NGINX_NAXSI
>  	bool "nginx-naxsi"
> +	select BR2_PACKAGE_PCRE
>  	help
>  	  NAXSI means Nginx Anti XSS & SQL Injection.

 I may be missing something, but shouldn't there be a _DEPENDENCIES += in .mk?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
