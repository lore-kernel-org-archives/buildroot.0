From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 16:51:08 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/oprofile: fix static
 linking
In-Reply-To: <20150816134325.GF7325@sapphire.tkos.co.il>
References: <1439732249-14832-1-git-send-email-yann.morin.1998@free.fr>
 <20150816134325.GF7325@sapphire.tkos.co.il>
Message-ID: <20150816145108.GE3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-08-16 16:43 +0300, Baruch Siach spake thusly:
> On Sun, Aug 16, 2015 at 03:37:29PM +0200, Yann E. MORIN wrote:
> > +# popt links with -lintl and specifies it in its popt.pc, and has done
> > +# so for the past 6+ years, but oprofile does not use pkconfig to find
> > +# popt, so we need to tell it to link with -lintl for a static build.
> > +ifeq ($(BR2_PACKAGE_GETTEXT)$(BR2_STATIC_LIBS),yy)
> > +OPROFILE_CONF_OPTS += LIBS=-lintl
> > +endif
> 
> Why not run $(PKG_CONFIG_HOST_BINARY) directly like we do in 
> package/logrotate/logrotate.mk for popt?

Good idea, I'll do. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
