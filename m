From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 16 Oct 2007 12:32:00 +0100
Subject: [Buildroot] AVR32 4.1.2 toolchain build issues [was
	svncommit:trunk/buildroot: target/device target/device/Atmel
	targetetc...]
In-Reply-To: <1192511723.28237.2.camel@localhost.localdomain>
References: <d6cda7730710140720r55bd9903s5001f0b864fe9952@mail.gmail.com>
	<02c301c80f72$254d2400$01c4af0a@Glamdring>
	<20071015221718.GA15524@reid1.localdomain>
	<059501c80f79$dd1305d0$01c4af0a@Glamdring>
	<20071015234955.GA18119@reid1.localdomain>
	<d6cda7730710151846n722419d9t806cea6018d1b54d@mail.gmail.com>
	<1192511723.28237.2.camel@localhost.localdomain>
Message-ID: <d6cda7730710160432o58fe50b1rda886dd0cdfafff0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/16/07, Hans-Christian Egtvedt <hcegtvedt@atmel.com> wrote:
> On Tue, 2007-10-16 at 02:46 +0100, Thiago A. Corr?a wrote:
> > Ok.... got it to build... it happens to be that atngw100_defconfig now
> > builds to a dir without nofp sufix, which makes me wonder if ppl have
> > decided weather this thing has or doesn't has an FP, perhaps it's a
> > paradox, or a dogma. You just have to belive it works. *smile*
> >
>
> It does not have an FPU, probably just a bad defconfig.

That was an attempt to pull up a joke, but looks that it wasn't much successful.

>
> The AVR32 fork has the bootloader in target/bootloader/u-boot, and is
> quite different from the one in the Atmel directory.

Different how? Version? If it is still the Das U-Boot, how different can it be?

> > Btw, is there a reason why u-boot is buried into Atmel folder?
> > Shouldn't other archs/chips use it as well?
> >
>
> The AVR32 fork on atmel.no tries to do the bootloader general for all
> archs.

Yes. I've noticed that :)
But I don't see any merges any time soon.... but when one does happen,
that should mean a little bit less effort.
Btw, still on the subject, how about bringing those snapshots a few
hundred revisions up to date? For instance, all the BR_avr32 checks
are backwards in the 2 trees, generating several stupid and avoidable
diffs.... Again, this is more work when/if a merge occurs. And I hope
it does.

> > Hopefully I will come back with patches once more (have a better
> > qtopia building, in a single stage, on the works).
> >
>
> You can't, Qtopia hard codes the path to the libraries inside the
> libraries. I have tried and ended up having to do a two stage build. One
> for staging_dir and one for the target dir.

Yes, I know. But it's mostly used on qmake to generate the project,
and that you should link against the stuff in the staging_dir. It
should also be used for plugin loading, but that can be overridden in
several ways. I have to check on the docs. At the worst case, it
should still be possible to sed qconfig.cpp (which is where the
hardcoded stuff lies), then rebuild from the already built tree, so
it's only 1 file to compile + link of everything else.

Besides, there is a lot of hardcoded configure options in there that I
don't really like, so, I'm adding config options to those in the
kconfig. For one, forcing on libjpeg isn't very nice :)

Friendly Regards,
   Thiago A. Correa
