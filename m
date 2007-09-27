From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 27 Sep 2007 04:00:48 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atngw100
In-Reply-To: <1190852864.4933.68.camel@elrond.atmel.sweden>
References: <20070920164416.41018A658C@busybox.net>
	<20070926210246.GB20951@aon.at>
	<1190852864.4933.68.camel@elrond.atmel.sweden>
Message-ID: <d6cda7730709262000o209dbfa3g21014cc682a5ce09@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some 300 revisions ago, I was able to disable stdlibc++-v3 from the
make menuconfig. AFAIK, -v3 is some legacy stuff (?). Or is the
stdlibc++ from gcc 4.x still called -v3?

Back then it also didn't build. Now, I'm on -r2040 and I can't disable
it anymore, even thought I'm using the same .config

On 9/27/07, Ulf Samuelsson <ulf@atmel.com> wrote:
> ons 2007-09-26 klockan 23:02 +0200 skrev Bernhard Fischer:
> > On Thu, Sep 20, 2007 at 09:44:16AM -0700, ulf at uclibc.org wrote:
> > >Author: ulf
> > >Date: 2007-09-20 09:44:15 -0700 (Thu, 20 Sep 2007)
> > >New Revision: 19912
> > >
> > >Log:
> > >Enable CONFIG_SEQ in busybox for ngw100
> > >
> > >Modified:
> > >   trunk/buildroot/target/device/Atmel/atngw100/busybox-1.6.1.config
> >
> > That's interresting. atngw100_defconfig doesn't build for me since at
> > least some hundred revisions.
>
> The toolset builds in the Atmel trunk at www.atmel.no/buildroot.
> Something has broken after I checked in that toolset, and tested it.
> I have been spending a lot of time trying to find out why.
>
> When C++ is select, there is a problem with the current trunk.
> The Atmel trunk, using the same source builds fine.
> Something has happened with the toolchain makefile between July
> and now, causing lots of problems building stdc++ver3.
>
> Recently the uClibc for AVR32 build broke.
> uclibc-0.9.28.config does not have the statement
> # TARGET_avr32 is not set
> I believe it was present in uclibc-0.9.28.3.config
>
> I think that using the default uCLibc configuration file will
> therefore use 386 architecture by default (you will get a question)
> If the default is accepted, then things will break.
>
> I just checked in a minimal build which does not exhibit the uClibc
> problem.
>
> make atngw100small_defconfig
>
> should use a working uClibc config file
>
> Will test building it during the night to see if there are other
> problems.
>
> BR
> Ulf Samuelsson
>
>
> >
> > Can you please show me the exact commands that are ment to build this
> > config?
> >
> > PS: In fact, what ATMEL defconfig can i use as a reference if *any*
> > of these ATMEL targets is building successfully?
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
