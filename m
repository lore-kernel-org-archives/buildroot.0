From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 01:10:00 +0100
Subject: [Buildroot] [PATCH 08/32] package/systemd: remove networkd
 depends from timesyncd
In-Reply-To: <1456437341-19025-9-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-9-git-send-email-gabe@hashrabbit.co>
Message-ID: <56CF97D8.7000603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 22:55, Gabe Evans wrote:
> systemd-timesyncd can function without systemd-networkd.

 Assuming that this is true:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 However,

> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/systemd/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 6edfba1..5d6759d 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -98,7 +98,6 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
>  
>  config BR2_PACKAGE_SYSTEMD_TIMESYNCD
>  	bool "enable SNTP client"

 SNTP?

> -	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
>  	help
>  	  systemd-timesyncd is a service that may be used to synchronize the
>  	  local system clock with a Network Time Protocol Server.

 Server -> server?

 Those are separate patches, obviously.

 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
