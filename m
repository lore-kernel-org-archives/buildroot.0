From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 10:30:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-07
In-Reply-To: <20180822072949.GX15347@scaer>
References: <20180808060047.9CC13209AD@mail.bootlin.com>
 <87mutwb2se.fsf@tkos.co.il> <20180822072949.GX15347@scaer>
Message-ID: <20180822083042.GY15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,All,

On 2018-08-22 09:29 +0200, Yann E. MORIN spake thusly:
> On 2018-08-09 07:08 +0300, Baruch Siach spake thusly:
> > Thomas Petazzoni writes:
> > > Results for branch 'master'
> > > ===========================
> > >
> > >       xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/55b271cceb5b749f911266ed96998c4ee730fb86 |     
> > >          sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/f8ff8c24d940113d7eb9729ae0b1b8e454cb4523 |     
> > >     mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/c1829952aec2356905a2d5559d77b3e79739ea21 |     
> > 
> > I could not reproduce this one here. The autobuilder indicates that it
> > only happens on the autobuilders of Yann, Romain and Richard:
> > 
> >   http://autobuild.buildroot.net/?reason=brltty-5.5
> > 
> > It looks like ATSPI2_INCLUDES and GLIB2_INCLUDES evaluate to empty
> > strings in Drivers/Screen/AtSpi2/Makefile.in on these
> > builders. config.log looks normal though.
> > 
> > Maybe one of you can take a look?
> 
> For the records, I'm still investigating this issue, and I found that
> there is a delta in generated files, that cause the build issue.
> 
> Now, the buildsystem for brltty is sufficiently inventive that it is not
> trivial to pinpoint why the generated files differ.
> 
> I'll be pursuing my investigations...

Aha! I found it! Aha!

https://patchwork.ozlabs.org/patch/960852/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
