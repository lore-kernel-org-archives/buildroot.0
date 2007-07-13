From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 14 Jul 2007 00:17:07 +0200
Subject: [Buildroot] [PATCH] Critical typo in /Makefile
In-Reply-To: <200707131237.19594.yann.morin.1998@anciens.enib.fr>
References: <f0528b5b0707130259n6132e765x28010199a1552451@mail.gmail.com>
	<200707131237.19594.yann.morin.1998@anciens.enib.fr>
Message-ID: <1184365027.22266.7.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-07-13 klockan 12:37 +0200 skrev Yann E. MORIN:
> On Friday 13 July 2007 11:59, Julien Letessier wrote:
> > Unless I'm missing something, this is a type and it breaks everything
> > (in particular by adding 2 spaces at the end of $(PROJECT))
> 
> Yep, I agree. In fact, the # ")) sequence is needed to fix syntax
> hightlighting in at least vi.
> Looks like we were not so quite close on the solution...
> 
> Thus the following should be better:
> 
> Index: Makefile
> ===================================================================
> --- Makefile    (revision 19080)
> +++ Makefile    (working copy)
> @@ -156,9 +156,12 @@
>  TARGETS:=uclibc
>  endif
> 
> -PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
> -TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
> -BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
> +PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
> +# "))
> +TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
> +# "))
> +BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
> +# "))
> 

OK, I saw the build was broken this this morning, 
but I had an early tee off time at the local golf club
followed by a party, so I did not have time to investigate.

Apparently, you need to put the comment '# " ))' on a separate line.

Will look into this tomorrow (Past midnight in Sweden and I am drunk and
tired...).


> Regards,
> Yann E. MORIN.
> 
