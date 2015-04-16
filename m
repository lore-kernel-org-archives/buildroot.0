From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Apr 2015 23:12:10 +0200
Subject: [Buildroot] [PATCH] ffmpeg: explicitly pass --ranlib
In-Reply-To: <1429214355-29429-1-git-send-email-arnout@mind.be>
References: <1429214355-29429-1-git-send-email-arnout@mind.be>
Message-ID: <20150416211210.GF4405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-16 21:59 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> It seems that ffmpeg's custom configure doesn't observe the RANLIB
> environment variable, and incorrectly uses the host's ranlib to
> check if the -D option is supported. Blackfin's ranlib doesn't, most
> others do.
> 
> I also checked if there are any more mistakes like that in ffmpeg's
> configure script, but it looked OK.

Your wording "ffmpeg's configure" prompted me to look at ffmpeg, and
so here's my thoughts about it...

Given that ffmpeg is not using autoconf, automake and co., it should not
be usign the autotools-package infra, but should be switched over to
using the generic-package infra instead.

OK, not your fault! ;-)

Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.net/results/d13488a43f6e034623104a36c07114db99325b8d
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Bernd Kuhs <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 787dbb1..59c49ee 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -18,6 +18,7 @@ endif
>  
>  FFMPEG_CONF_OPTS = \
>  	--prefix=/usr \
> +	--ranlib=$(TARGET_RANLIB) \
>  	--enable-avfilter \
>  	--disable-version3 \
>  	--enable-logging \
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
