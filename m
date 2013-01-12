From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jan 2013 14:36:46 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: requires iconv
In-Reply-To: <874nim8r7e.fsf@dell.be.48ers.dk>
References: <1357995215-26554-1-git-send-email-yann.morin.1998@free.fr>
 <874nim8r7e.fsf@dell.be.48ers.dk>
Message-ID: <201301121436.46822.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Saturday 12 January 2013 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  Yann> +++ b/package/dvb-apps/dvb-apps.mk
>  Yann> @@ -20,10 +20,16 @@ DVB_APPS_LICENSE        = unknown (probably public domain)
>  
>  Yann>  ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
>  Yann>  # Utilitiess are selected, build and install everything
>  Yann> +
>  Yann> +ifeq ($(BR2_ENABLE_LOCALE),)
>  Yann> +DVB_APPS_DEPENDENCIES    = libiconv
>  Yann> +DVB_APPS_LDFLAGS         = $(TARGET_LDFLAGS) -liconv
>  Yann> +endif
>  Yann> +
>  Yann>  DVB_APPS_INSTALL_STAGING = YES
>  
>  Yann>  define DVB_APPS_BUILD_CMDS
>  Yann> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) V=1
>  Yann> +	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(DVB_APPS_LDFLAGS)" $(MAKE) -C $(@D) V=1
> 
> Ehh, so if you have locale you pass an empty LDFLAGS?

Strangely enough, this build fine with a toolchain with or without
locales. :-(

OK, break, will come back to this later... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
