From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Apr 2014 00:18:59 +0200
Subject: [Buildroot] [PATCH 4/6] tzdump: new host package
In-Reply-To: <87d2gra2qt.fsf@dell.be.48ers.dk>
References: <cover.1396900553.git.yann.morin.1998@free.fr>
 <bd0d8b1e63d1946a8dd482f5d40c54008bed8081.1396900553.git.yann.morin.1998@free.fr>
 <87d2gra2qt.fsf@dell.be.48ers.dk>
Message-ID: <20140408221859.GA25398@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-04-09 00:13 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>  > tzdump takes timezone info in the installed tzdata format, and
>  > outputs timezone info parseable by uClibc.
> 
>  > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>  > [yann.morin.1998 at free.fr: split zic header-install to its own cset]
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > ---
>  >  package/tzdump/tzdump.mk | 24 ++++++++++++++++++++++++
>  >  1 file changed, 24 insertions(+)
>  >  create mode 100644 package/tzdump/tzdump.mk
> 
>  > diff --git a/package/tzdump/tzdump.mk b/package/tzdump/tzdump.mk
>  > new file mode 100644
>  > index 0000000..471a719
>  > --- /dev/null
>  > +++ b/package/tzdump/tzdump.mk
>  > @@ -0,0 +1,24 @@
>  > +################################################################################
>  > +#
>  > +# tzdump
>  > +#
>  > +################################################################################
>  > +
>  > +TZDUMP_VERSION = 65a10105564801094b18c3fcacf4dde4c44e4ab8
>  > +TZDUMP_SITE = $(call github,alexandrebelloni,tzdump,$(TZDUMP_VERSION))
>  > +TZDUMP_DEPENDENCIES = host-zic
> 
> It doesn't look like this is needed.

Well, it's host-tzdump that needs host-zic, since the former needs a
header installed by the latter.

So, this should have been:

    HOST_TZDUMP_DEPENDENCIES = host-zic

>  > +define HOST_TZDUMP_INSTALL_CMDS
>  > +	mkdir -p $(HOST_DIR)/usr/sbin
>  > +	install -D -m 755 $(@D)/tzdump $(HOST_DIR)/usr/sbin/tzdump
> 
> install -D already creates the destination directory, so mkdir can be
> dropped.
> 
> We normally use the INSTALL variable instead of explicit 'install'.

Doh, I missed that one... :-(

> Committed with these fixes, thanks.

Hopefully, you'll get this in time to re-fix the host-zic dependency
before you push...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
