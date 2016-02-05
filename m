From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 5 Feb 2016 23:02:08 +0100
Subject: [Buildroot] [PATCH 1/1] xdotool: needs MMU support
In-Reply-To: <1454627981-27595-1-git-send-email-nunes.erico@gmail.com>
References: <1454627981-27595-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <56B51BE0.3020808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05-02-16 00:19, Erico Nunes wrote:
> Fixes:
> http://autobuild.buildroot.net/results/d750919a0d5cfb624937c72253651a431212e238
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/xdotool/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/xdotool/Config.in b/package/xdotool/Config.in
> index 4d5f590..4fb8a49 100644
> --- a/package/xdotool/Config.in
> +++ b/package/xdotool/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_XDOTOOL
>  	bool "xdotool"
>  	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_XLIB_LIBXTST
>  	select BR2_PACKAGE_XLIB_LIBXINERAMA
>  	select BR2_PACKAGE_LIBXKBCOMMON
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
