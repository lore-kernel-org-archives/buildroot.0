From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 15:41:59 +0100
Subject: [Buildroot] [PATCH] system: allow not setting a default,
 system-wide time zone
In-Reply-To: <20191116091004.23726-1-yann.morin.1998@free.fr>
References: <20191116091004.23726-1-yann.morin.1998@free.fr>
Message-ID: <b074a89e-682a-76a1-d704-36fb0634311b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

On 16/11/2019 10:10, Yann E. MORIN wrote:
> It is valid that there is no system-wide default time zone defined, in
> which case Etc/UTC is assumed.
> 
> Fixes: #12316
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Martin Bark <martin@barkynet.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Richard Braun <rbraun@sceen.net>
> Cc: Andrew Trapani <andrew.trapani@ontera.bio>
[snip]
> diff --git a/system/Config.in b/system/Config.in
> index c87266f431..c8c5be40e0 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -494,6 +494,8 @@ config BR2_TARGET_LOCALTIME
>  	    Pacific/Wallis
>  	    ...
>  
> +	  Set to empty to not install a default time zone.

 Maybe we should then also change the default to empty? Then at least this use
case gets tested in the autobuilders. Oh, maybe adding a few possible values for
this config in genrandconfig would be nice as well...

 BTW, I notice now that BR2_TARGET_TZ_ZONELIST is not used for uClibc (tz). Is
that expected? Maybe it should depend on !UCLIBC then?

 Regards,
 Arnout

> +
>  endif # BR2_TARGET_TZ_INFO
>  
>  config BR2_ROOTFS_USERS_TABLES
> 
