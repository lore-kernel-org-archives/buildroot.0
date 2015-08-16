From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 23:48:43 +0200
Subject: [Buildroot] [PATCHv2] [autobuild] package/oprofile: fix static
	linking
In-Reply-To: <20150816180245.GE2765@tarshish>
References: <1439736807-29324-1-git-send-email-yann.morin.1998@free.fr>
 <20150816180245.GE2765@tarshish>
Message-ID: <20150816214843.GH3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-08-16 21:02 +0300, Baruch Siach spake thusly:
> On Sun, Aug 16, 2015 at 04:53:27PM +0200, Yann E. MORIN wrote:
> > +# popt links with -lintl and specifies it in its popt.pc, and has done
> > +# so for the past 6+ years, but oprofile does not use pkconfig to find
> > +# popt, so we need to tell it to link with -lintl for a static build.
> > +ifeq ($(BR2_PACKAGE_GETTEXT)$(BR2_STATIC_LIBS),yy)
> > +OPROFILE_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
> > +endif
> 
> Well, the whole point of running $(PKG_CONFIG_HOST_BINARY) is that its output 
> matches the actual build dependencies. So the 'ifeq' should not be needed, 
> just like logrotate.

So true. Thanks for the reviews! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
