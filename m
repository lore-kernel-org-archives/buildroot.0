From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 4 Sep 2013 14:14:29 +0200
Subject: [Buildroot] [PATCH] dependencies: Add host prerequisite for
	elf2flt
In-Reply-To: <20130904133445.0af91136@skate>
References: <1378282615.12336.1.camel@phoenix> <20130904105101.1662e059@skate>
 <52270CBA.1000603@zacarias.com.ar> <20130904131900.7225d262@skate>
 <52271915.6050702@zacarias.com.ar> <20130904133445.0af91136@skate>
Message-ID: <CAAXf6LVjZ6tM4PX_RDBmwXP8ANM9BQccukTDqGWLE9jmw90VZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 4-sep.-2013 13:35 schreef "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> het volgende:
>
> Dear Gustavo Zacarias,
>
> On Wed, 04 Sep 2013 08:27:17 -0300, Gustavo Zacarias wrote:
>
> > > Indeed. If it's not needed during the gcc build, one solution is to
add
> > > its as a dependency in host-gcc-final.
> >
> > It's needed for some uClibc combination, link-flat.so which uses elf2flt
> > pulls in libgcc according to uclibc/Makerules (used in
> > uclibc/libc/Makefile.in).
> > I think it's safer to pull it in for gcc-intermediate or even
gcc-initial.
>
> gcc-intermediate is going to be skipped in some situations after my
> patch "[PATCHv2 03/14] toolchain-internal: skip gcc-intermediate when
> possible" is merged.
>
> So, as a dependency of gcc-initial seems like a better choice.

I know little about this flat format, but isn't it possible to use an
external toolchain and still want flat binaries?

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130904/5cd44cd6/attachment.html>
