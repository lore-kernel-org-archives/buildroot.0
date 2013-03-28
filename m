From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Mar 2013 08:12:38 +0100
Subject: [Buildroot] [PATCH 4/4] Enable feature CONFIG_FEATURE_PIDFILE
 so that the syslog initscript actually works
In-Reply-To: <1364222893-23858-4-git-send-email-arved@arved.at>
References: <1364222893-23858-1-git-send-email-arved@arved.at>
 <1364222893-23858-4-git-send-email-arved@arved.at>
Message-ID: <5153ED66.3090001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Tilman,


On 25/03/13 15:48, arved at arved.at wrote:
> From: Tilman Keskin?z <arved@arved.at>
>
>
> Signed-off-by: Tilman Keskin?z <arved@arved.at>
> ---
>   package/busybox/busybox-1.20.x.config |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/busybox/busybox-1.20.x.config b/package/busybox/busybox-1.20.x.config
> index 5525434..d199996 100644
> --- a/package/busybox/busybox-1.20.x.config
> +++ b/package/busybox/busybox-1.20.x.config
> @@ -41,7 +41,7 @@ CONFIG_FEATURE_DEVPTS=y
>   CONFIG_FEATURE_CLEAN_UP=y
>   CONFIG_FEATURE_UTMP=y
>   CONFIG_FEATURE_WTMP=y
> -# CONFIG_FEATURE_PIDFILE is not set
> +CONFIG_FEATURE_PIDFILE=y

  Since we care very much about the size of busybox, could you evaluate 
what the size difference is before and after this change?  One smallish 
architecture (e.g. ARM) is enough.

  Could you also make this change to the other busybox versions as well? 
The different busybox configs should only differ because of features 
added/removed in that particular version.


  Regards,
  Arnout

>   CONFIG_FEATURE_SUID=y
>   # CONFIG_FEATURE_SUID_CONFIG is not set
>   # CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
