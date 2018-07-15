From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jul 2018 17:44:41 +0200
Subject: [Buildroot] [PATCH v3 10/22] package/x11r7/xkeyboard-config:
 switch to xorgproto
In-Reply-To: <omcn1fx702.ln2@ID-313208.user.individual.net>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-11-bernd.kuhls@t-online.de>
 <20180702214801.GP2604@scaer>
 <omcn1fx702.ln2@ID-313208.user.individual.net>
Message-ID: <20180715154441.GB2516@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-07-13 21:55 +0200, Bernd Kuhls spake thusly:
> Am Mon, 02 Jul 2018 23:48:01 +0200 schrieb Yann E. MORIN:
> >> --- a/package/x11r7/xkeyboard-config/Config.in
> >> +++ b/package/x11r7/xkeyboard-config/Config.in
> >> @@ -3,7 +3,7 @@ config BR2_PACKAGE_XKEYBOARD_CONFIG
> >>  	# Runtime dependencies

Here ^^^

> >>  	select BR2_PACKAGE_XAPP_XKBCOMP if BR2_PACKAGE_XORG7
> >>  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> >> -	select BR2_PACKAGE_XPROTO_XPROTO if BR2_PACKAGE_XORG7
> >> +	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7
> > 
> > I'm always a bit warry about dependencies selected, that are not in the
> > .mk. Is it missing there?
> 
> Afaics they are not missing in the.mk file because these packages are 
> marked as runtime dependencies in Config.in.

As noted above, yes, they are marlked "runtime dependencies".

However, I find it hard to believe that the xorg-proto, which supposedly
provides prototype information, is only a runtime dependency.

Similarly, I also find it hard to accept that xlib-libx11 is only a
runtime dependency.

I am afraid that only xapp-xkbcomp is actually a runtime dependency. The
rest are really build-time dependencies. /me thinks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
