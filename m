From: Allan Clark <allanc@chickenandporn.com>
Date: Mon, 16 Jul 2007 09:21:18 -0400
Subject: [Buildroot] error building toolchain with gettext /libintl
In-Reply-To: <1184576580.18357.4.camel@elrond.sweden.atmel.com>
References: <C03A3C267DDF184EA523BBAB577BF924C22CF4@blrexsr1.slti.sanyo.co.in>
	<1184576580.18357.4.camel@elrond.sweden.atmel.com>
Message-ID: <37c712e0707160621r711f069en12462aa0fd8dadb4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7/16/07, Ulf Samuelsson <ulf@atmel.com> wrote:
> m?n 2007-07-16 klockan 09:02 +0530 skrev Gururaja Hebbar K R:
> >  Hi all,
> >
> > I am trying to build a ARM toolchain in buildroot for the 1st time with
> > below mentioned config. Everything goes fine till gettext building. when
> > make gettext-target is executed it halts with error saying
> >
> > cp -dpf
> > /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/u
> > sr/lib/libgettext*.so* \
>
> I have noted this as well, and the problem is that
>
> "staging_dir/usr/lib/libgettext*.so* " was never created.
>
> Instead "staging_dir/usr/lib/libgettext*.a" was created.
>
> This problem has been around for a long time.
>
>
> I have yet to figure out how to make the ARM gcc build the
> shared library instead of the static library
>
> Is it possible to supply "--with-shared" or something
> when configuring?

Same problem happens on MacOSX with libgmp.a building, not libgmp.so,
but it simply triggers a rebuild of later components.  It's not fatal
in my case.  I believe --with-shared is being given, but the library
still doesn't build the .so.  I remember some link issues, but I'm
still having the problem that uclibc fails to build the first time,
but seems to on the second try, trying to see why this started.

The common trend here is that either the build system thinks it should
have a *.so, and it isnt being built (different logic) or it should
have it, and there's an error that gets simply ignored.  's why I
mention this.

Allan
