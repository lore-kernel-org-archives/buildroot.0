From: Rainer Berns <rainer.berns@berns-online.de>
Date: Mon, 1 Dec 2014 20:50:10 +0100 (CET)
Subject: [Buildroot] [PATCH] package/mono: fixing wrong monolite library path
Message-ID: <1107172282.388978.1417463410889.JavaMail.open-xchange@oxbaltgw02.schlund.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo 

building mono in buildroot-2014.11 is now ok.
Thanks

Tested-by: Rainer Berns <Rainer.Berns@berns-online.de>

Angelo, Rainer, All,

On 2014-11-30 22:41 +0100, Angelo Compagnucci spake thusly:
> Due to a bug in makefile logic, monolite libraries path will not
> be selected when EXTERNAL_MCS parameter is specified.
> Setting EXTERNAL_MCS to a non existent binary, makes the internal logic
> to fallback to monolite, setting correctly both binary and
> library paths.
> This has the benefit to force host-mono to always use monolite as
> bootstrap compiler also in case a mono compiler is already installed
> on the system.
> 
> Fixes:
> http://autobuild.buildroot.net/results/fc00952bef03cf3b4785be1a0d9c08dc84aa3f54/
> 
> 

Angelo, it is customary to add a reported-by tag to credit the person
that reported a bug. It's done like so:

Reported-by: Rainer Berns <rainer.berns@berns-online.de>

It is also customary to put the reporter in Cc: so he gets a proposed
fix and gets to test it.

Rainer, care to test this patch, please? If it works, can you reply to
this mail and add your tested-by tag?

It's done like so: Tested-by Your NAME <you@there>

Thank you both! :-)

/me is feeling like being educative tonight. Hihi! ;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/mono/mono.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> index df67c33..d4beb5f 100644
> --- a/package/mono/mono.mk
> +++ b/package/mono/mono.mk
> @@ -55,7 +55,7 @@ HOST_MONO_CONF_OPTS += \
>  	--with-profile4=$(if $(BR2_PACKAGE_MONO_40),yes,no) \
>  	--with-profile4_5=$(if $(BR2_PACKAGE_MONO_45),yes,no)
>  
> -HOST_MONO_MAKE_OPTS += EXTERNAL_MCS="$(@D)/mcs/class/lib/monolite/basic.exe"
> +HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false 
>  
>  HOST_MONO_DEPENDENCIES = host-monolite host-gettext
>  
> -- 
> 2.2.0
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
