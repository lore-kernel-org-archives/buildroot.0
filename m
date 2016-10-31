From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Oct 2016 13:43:22 +0100
Subject: [Buildroot] [PATCH v3 8/9] lttng-babeltrace: add debug info
 support
In-Reply-To: <20161031112449.GI3389@free.fr>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-9-eeppeliteloop@gmail.com>
 <20161031112449.GI3389@free.fr>
Message-ID: <20161031124322.GA13598@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-31 12:24 +0100, Yann E. MORIN spake thusly:
> On 2016-10-31 03:46 -0400, Philippe Proulx spake thusly:
> > Since Babeltrace 1.4, there is support for printing debug information
> > along with compatible traces and event records. Babeltrace needs
> > elfutils in this case. If elfutils can be built with the current
> > configuration, the lttng-babeltrace package selects it and builds
> > with support for debug information. Otherwise the menuconfig shows
> > a comment which explains why debug information support cannot be
> > built.
> > 
> > Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
[--SNIP--]
> > diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
> > index 30c5f6e..260a8ee 100644
> > --- a/package/lttng-babeltrace/lttng-babeltrace.mk
> > +++ b/package/lttng-babeltrace/lttng-babeltrace.mk
> > @@ -18,5 +18,12 @@ HOST_LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
> >  # For 0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
> >  LTTNG_BABELTRACE_AUTORECONF = YES
> > 
> > +ifeq ($(BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO),y)
> > +LTTNG_BABELTRACE_DEPENDENCIES += elfutils
> > +LTTNG_BABELTRACE_CONF_OPTS += --enable-debug-info
> > +else
> > +LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
> > +endif

But you forgot to remove the unconditional one on line 13.

Regards,
Yann E. MORIN.

> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))
> > --
> > 2.9.3
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
