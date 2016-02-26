From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 01:01:51 +0100
Subject: [Buildroot] [PATCH 03/32] package/systemd: add
 --enable/disable-bzip2
In-Reply-To: <1456437341-19025-4-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-4-git-send-email-gabe@hashrabbit.co>
Message-ID: <56CF95EF.4050400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 22:55, Gabe Evans wrote:
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I think this one is for master!

 Regards,
 Arnout

> ---
>  package/systemd/systemd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 7a1baf5..ac211c8 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -76,6 +76,13 @@ else
>  SYSTEMD_CONF_OPTS += --disable-kdbus
>  endif
>  
> +ifeq ($(BR2_PACKAGE_BZIP2),y)
> +SYSTEMD_DEPENDENCIES += bzip2
> +SYSTEMD_CONF_OPTS += --enable-bzip2
> +else
> +SYSTEMD_CONF_OPTS += --disable-bzip2
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XZ),y)
>  SYSTEMD_DEPENDENCIES += xz
>  SYSTEMD_CONF_OPTS += --enable-xz
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
