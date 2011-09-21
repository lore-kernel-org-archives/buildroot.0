From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2011 08:52:45 +0200
Subject: [Buildroot] Xtensa support
In-Reply-To: <522C1DF17AF50042AD8AE87F7887BD3D020C5F4943@exch.hq.tensilica.com>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
 <20110315180743.5e34890b@surf>
 <1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
 <20110315192211.3c59f861@surf>
 <1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
 <20110315210538.1973f87f@surf>
 <779935.72384.qm@web161802.mail.bf1.yahoo.com>
 <4D81FB3E.7060307@carallon.com> <20110318165939.651bf88b@surf>
 <4D87C0B5.1090503@tensilica.com> <20110920203530.2cc44bee@skate>
 <522C1DF17AF50042AD8AE87F7887BD3D020C5F4943@exch.hq.tensilica.com>
Message-ID: <20110921085245.149d3c03@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marc,

Le Tue, 20 Sep 2011 21:01:35 -0700,
Marc Gauthier <marc@tensilica.com> a ?crit :

> If you're curious, some of it is here, but far from cleaned up!!:
> 
> http://git.linux-xtensa.org/cgi-bin/git.cgi?p=buildroot/buildroot-new.git;a=shortlog;h=Xtensa-Patches

Sounds like most of those patches are patches against uClibc, binutils
or gdb. It'd be better to have those patches merged in their respective
upstreams rather than integrating those patches into Buildroot.

> > I am remain concerned by the fact that we carry some special stuff
> > to support Xtensa, but he Xtensa architecture support has never been
> > updated since it was merged in Buildroot. Of course, it is our goal
> > to support configurable architectures such as Xtensa, but the
> > support for those architectures needs to be actively maintained in
> > Buildroot upstream.
> 
> Yes.  For example, some of the xtensa files under /target/ need to be
> moved and/or refactored.  And a defconfig added in /configs/.
> (Hopefully you now take pull requests?  easier than patches)

We do take pull requests, but we like when patches are posted on the
mailing list as well. This is easy to do with a combination of git
pull-request + git send-email. I can share my little script to do that
if you're interested.

> > Unfortunately, none of the main Buildroot developers have
> > Xtensa-capable hardware, so it's a bit hard to contribute to this
> > effort.
> 
> Do I hear volunteers? :-)  We've discussed sending out boards in the
> past, but that turned out to be a bit more sideline effort than hoped.
> Looks like an easier approach is to use an instruction set simulator.
> It can boot Linux, so should be fine.  If you're interested I'll be
> very happy to share the details.  Helping hands are most appreciated.

Having a working emulator setup would definitely be nice. However, to
get volunteers working on something freely, one needs to put some
incentive on the table. And usually, in the embedded space, this
incentive is a nice hardware platform, that the open-source developer
is so happy to receive that he will be interested in contributing. The
charm of having a real hardware platform is a lot higher than the charm
of the emulator, as is the incentive to contribute things :-)

Of course, regardless of whether boards are made available or not, we
will gladly take patches, review them, comment them, and help you
merging as much as possible of the Xtensa support into the mainline
Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
