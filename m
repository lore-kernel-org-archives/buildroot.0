From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 14:51:25 +0200
Subject: [Buildroot] [arc-buildroot] [PATCH] toolchain: bump ARC tools
 to arc-2020.03-eng002
In-Reply-To: <CY4PR1201MB0120B779B9C5AB3AA1BCE0E7A1C30@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20200406140719.41518-1-Evgeniy.Didin@synopsys.com>
 <20200407060912.GB22325@scaer>
 <CY4PR1201MB0120B779B9C5AB3AA1BCE0E7A1C30@CY4PR1201MB0120.namprd12.prod.outlook.com>
Message-ID: <20200407125125.GN22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2020-04-07 09:37 +0000, Alexey Brodkin spake thusly:
> > On 2020-04-06 17:07 +0300, Evgeniy Didin spake thusly:
> > > This commit bumps ARC toolchain to arc-2020.03-eng002. We want
> > > to test how new toolchain-eng002 builds packages, so we can make
> > > fixes before release of toolchain.
> > >
> > > Please note that it is an engineering build and it might have
> > > all kind of breakages, please don't use it for production builds.
> > 
> > So why would we want to have it in Buildroot?
> > 
> > If you need to have some confidence about your toolchain, you could spin
> > your own autobuilder and check the results (but not send them for
> > a.b.o).
> > 
> > I've marked the patch as rejected, sorry.
> 
> I think we've been doing that for years. See:

Thomas already mentioned that on IRC (after I replied), that we did have
such toolchains in the past.

However, I do not agree. The commit explicitly mentions "do not use for
production builds". I don't want to carry in Buildroot such a toolchain.

> And it's not only for spinning our WIP, as a matter of fact we
> never post real WIP snapshots because that will introduce way too many
> breakages we'll need to fix, so only when our extensive internal testing
> shows acceptable results we're ready to use it for something else.
> 
> And there's yet another reason: that way we secure our more
> recent toolchain in the next Buildroot release. See that eng002 is
> supposed to become RC1 but now we're gated by some problems with Eclipse
> IDE plugins (see https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/255)
> and just because of that non-related to the GNU toolchain itself problem we
> might be ready to post RC1 (not to mention final release) in Buildroot
> a bit too late and so use older toolchain for ARC until the next release
> in a few months.

Well, to me it is as all the other components: if they are not ready by
the time we cut rc1, then too bad; they'll make it the next cycle, which
is a mere three months later.

> But if by the time of Buildroot's RC1 we have whatever pre-release version
> of newer ARC GNU tools merged then we may easily bump version number before
> Buildroot's release and in the worst case except name there will be 1 or 2
> fixes.

Sorry, but I do not buy that argument.

The rc cycle of Buildroot is (to my point of view) not a way to provide rc
cycle to components. The Buildroot rc cycle is for stabilising Buildroot
itself, pointing to components that have alredy been stabilised (bugs
are bugs, we can't predict them so it's OK to have a bug fix for a
component).

But I don;t think we should accept that the rc cycle of Buildroot serves
as the rc cycle of components, which is bnasically what I understand as
your reason for pushing an engineering build of your toolchain; even rc1
of the toolchain would not be a candidate in my optinion.

I know that my point diverges from previous behaviour. Other maintainers
may also disagree. I'll mark the patch as new again in patchwork, so
they have the opportunity to reverse my decision.

> And as usual I'm happy to mention that we're getting closer and closer to
> upstream so that in GCC10 we have pretty much all the changes we need as well
> as upcoming Binutils as of now have everything for ARC. So I do expect to
> drop ARC-fork from Buildroot soon in favor of just a few patches on top of the most
> recent release.

I do appreciate the work you are doing, and I find it great that we can
soon build an upstream toolchain. Upstreaming the toolchain parts is a
tough job, so I'm glad to see this positive report! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
