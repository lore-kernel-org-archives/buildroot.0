From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2012 23:40:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/dvb-apps: new package
In-Reply-To: <87ehi9yflu.fsf@dell.be.48ers.dk>
References: <cover.1356731295.git.yann.morin.1998@free.fr>
 <d4ede3beb81857dfef0587def373e943f2a6100d.1356731295.git.yann.morin.1998@free.fr>
 <87ehi9yflu.fsf@dell.be.48ers.dk>
Message-ID: <201212282340.54395.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Friday 28 December 2012 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  Yann> We just need the transponders data, so we just install those.
> 
> Long term I think it would be good to make this a user visible package,
> and have sub options for what kind of transponder data you want to
> install, as it's fairly big (~3.4MB).

Yes, but one thing at a time. ;-)

>  Yann> +define DVB_APPS_INSTALL_TARGET_CMDS
>  Yann> +	mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/atsc
>  Yann> +	mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/dvb-c
>  Yann> +	mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/dvb-s
>  Yann> +	mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/dvb-t
>  Yann> +	$(INSTALL) -D $(@D)/util/scan/atsc/* $(TARGET_DIR)/usr/share/dvb-apps/scan/atsc
> 
> install -D expects you to name the destination file name, which doesn't
> make sense here, so I rewrote the install step to use a shell loop and
> not use the -D option.

Doh. Great, thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
