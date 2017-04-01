From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 22:50:30 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/bluez-tools: new package
In-Reply-To: <20170209213019.a3tweamrwr27dnk3@tarshish>
References: <20170209212616.32550-1-bernd.kuhls@t-online.de>
 <20170209213019.a3tweamrwr27dnk3@tarshish>
Message-ID: <20170401225030.18243af4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Feb 2017 23:30:19 +0200, Baruch Siach wrote:

> On Thu, Feb 09, 2017 at 10:26:16PM +0100, Bernd Kuhls wrote:
> > +ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
> > +BLUEZ_TOOLS_DEPENDENCIES += bluez_utils
> > +# readline is an optional dependency when used with bluez_utils
> > +# obex support depends on readline so enable it optionally
> > +ifeq ($(BR2_PACKAGE_READLINE),y)
> > +BLUEZ_TOOLS_CONF_OPTS += --enable-obex
> > +BLUEZ_TOOLS_DEPENDENCIES += readline
> > +else
> > +BLUEZ_TOOLS_CONF_OPTS += --disable-obex
> > +endif
> > +else
> > +# readline is a hard dependency when used with bluez5_utils
> > +BLUEZ_TOOLS_DEPENDENCIES += bluez5_utils readline
> > +endif  
> 
> Looks overly complex to me. Why not treat readline as a usual optional 
> dependency, independent from the bluez version?

I hesitated a bit as well on this one, but in the end, I found the
solution from Bernd to have the advantage of making very clear/explicit
what's going with readline: when it is optional/mandatory, what
autoconf options can be enabled when it is optional, etc. So I decided
to keep it as Bernd proposed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
