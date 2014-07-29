From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jul 2014 00:51:32 +0200
Subject: [Buildroot] [PATCH v4 1/1] New package: openvmtools
In-Reply-To: <CABbD_XBsgVB7KQPwKoEJDz3JOJ61_2AJO=JtNOWy+yiRqgrTQQ@mail.gmail.com>
References: <1406635032-34970-1-git-send-email-kaszak@gmail.com>
 <20140729211549.GA5846@free.fr>
 <CABbD_XBsgVB7KQPwKoEJDz3JOJ61_2AJO=JtNOWy+yiRqgrTQQ@mail.gmail.com>
Message-ID: <20140729225132.GC5846@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-07-30 00:41 +0200, K?roly Kasza spake thusly:
> Thanks for reviewing my patch!

Cheers! ;-)

[--SNIP--]
> > This scripts uses a mix of tabs and spaces to do the indentation; for
> > example, the cases lines ("start)", "stop)"...) are indented with
> > spaces, while the rest is indented with tabs. Please be consistent.
> 
> I used dropbear's startup script as a template, and the indentation is
> exactly the same. Also with openssh, exim or ptpd (and possibly some
> others). I think I should not differ from those too much?

OK, I undersand. But those scripts were intially written a loooong time
ago. We prefer that new submissions be a bit more coherent. Eventually,
someone will clean up those old scripts. One day. Maybe... ;-)

> > > +
> > > +exit $?
> >
> > No need to exit epxlicitly, it's implicit from POSIX, that a shell
> > script exits with the error code from the last command. Besides, we do
> > not care at all about the exit status of a startup script.
> 
> Although you are right, it's on the end of the dropbear startup script and
> 26 other initscripts in the package/ subdir. I think I should leave this to
> stay consistent with the others as above.

I prefer we introduce sane new scripts. As said above, the others are
really old, and no longer up to nowadays standards...

> > > +OPENVMTOOLS_CONF_OPT = \
> > > +        --without-icu \
> > > +        --without-x \
> > > +        --without-gtk2 \
> > > +        --without-gtkmm \
> > > +        --without-kernel-modules
> >
> > On a single line. If it is too long, just split it, like:
> >
> >     OPENVMTOOLS_CONF_OPT = --without-icu --without-x \
> >             --without-gtk2 --without-gtkmm --without-kernel-modules
> 
> OK. I though it is more visible.

I agree, but that's not the coding rules. ;-)

> > No --enable-fuse/--disable-fuse options (or the likes)?
> 
> Unfortunately not. If the "configure" script finds libfuse, it builds
> vmblock-fuse, else it won't. I experimented with it a bit, and found this
> the most logical solution.

OK, then.

> Thanks again, I'll send a v5 patch soon. Regarding the init script, I can
> use only spaces/tabs, but then this script will differ from the others.
> Should I?

Yes, new scripts should be cleaner and saner than the old ones.

Thanks for your persistence with this patch! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
