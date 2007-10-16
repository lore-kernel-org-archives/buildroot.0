From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Tue, 16 Oct 2007 13:46:08 +0200
Subject: [Buildroot] AVR32 4.1.2 toolchain build issues
	[was	svncommit:trunk/buildroot: target/device
	target/device/Atmel targetetc...]
In-Reply-To: <d6cda7730710160432o58fe50b1rda886dd0cdfafff0@mail.gmail.com>
References: <d6cda7730710140720r55bd9903s5001f0b864fe9952@mail.gmail.com>
	<02c301c80f72$254d2400$01c4af0a@Glamdring>
	<20071015221718.GA15524@reid1.localdomain>
	<059501c80f79$dd1305d0$01c4af0a@Glamdring>
	<20071015234955.GA18119@reid1.localdomain>
	<d6cda7730710151846n722419d9t806cea6018d1b54d@mail.gmail.com>
	<1192511723.28237.2.camel@localhost.localdomain>
	<d6cda7730710160432o58fe50b1rda886dd0cdfafff0@mail.gmail.com>
Message-ID: <1192535168.8176.7.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2007-10-16 at 12:32 +0100, Thiago A. Corr?a wrote:
> On 10/16/07, Hans-Christian Egtvedt <hcegtvedt@atmel.com> wrote:
> > On Tue, 2007-10-16 at 02:46 +0100, Thiago A. Corr?a wrote:
> >
> > The AVR32 fork has the bootloader in target/bootloader/u-boot, and is
> > quite different from the one in the Atmel directory.
> 
> Different how? Version? If it is still the Das U-Boot, how different can it be?
>

It is the latest release + some from upstream GIT and some from Atmel
GIT. Mainly NGW100 support from Atmel GIT.

> > > Btw, is there a reason why u-boot is buried into Atmel folder?
> > > Shouldn't other archs/chips use it as well?
> > >
> >
> > The AVR32 fork on atmel.no tries to do the bootloader general for all
> > archs.
> 
> Yes. I've noticed that :)
> But I don't see any merges any time soon.... but when one does happen,
> that should mean a little bit less effort.

Depends what you mean by soon, it will probably be after the first
stable release with all the features enabled by default working.

> Btw, still on the subject, how about bringing those snapshots a few
> hundred revisions up to date? For instance, all the BR_avr32 checks
> are backwards in the 2 trees, generating several stupid and avoidable
> diffs.... Again, this is more work when/if a merge occurs. And I hope
> it does.
> 

I will sync after the next release, I also plan to get out a GIT
repository for those who want easier access to the Atmel specific fork.

> > > Hopefully I will come back with patches once more (have a better
> > > qtopia building, in a single stage, on the works).
> > >
> >
> > You can't, Qtopia hard codes the path to the libraries inside the
> > libraries. I have tried and ended up having to do a two stage build. One
> > for staging_dir and one for the target dir.
> 
> Yes, I know. But it's mostly used on qmake to generate the project,
> and that you should link against the stuff in the staging_dir. It
> should also be used for plugin loading, but that can be overridden in
> several ways. I have to check on the docs. At the worst case, it
> should still be possible to sed qconfig.cpp (which is where the
> hardcoded stuff lies), then rebuild from the already built tree, so
> it's only 1 file to compile + link of everything else.
> 

It sounds really nice, would reduce the compile time and disk usage a
lot.

> Besides, there is a lot of hardcoded configure options in there that I
> don't really like, so, I'm adding config options to those in the
> kconfig. For one, forcing on libjpeg isn't very nice :)
> 

More config options are welcome (-: When I started on Qtopia, the build
process in Buildroot was not working at all.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
