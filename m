From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 01:08:23 +0100
Subject: [Buildroot] [PATCH 07/32] package/systemd: explicitly
 --enable/disable-microhttpd
In-Reply-To: <1456437341-19025-8-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-8-git-send-email-gabe@hashrabbit.co>
Message-ID: <56CF9777.9080905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Subject is wrong: you only add --enable. With that:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

On 02/25/16 22:55, Gabe Evans wrote:
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 18e0c5c..639b8a5 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -122,6 +122,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
>  SYSTEMD_DEPENDENCIES += libmicrohttpd
> +SYSTEMD_CONF_OPTS += --enable-microhttpd
>  else
>  SYSTEMD_CONF_OPTS += --disable-microhttpd
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
