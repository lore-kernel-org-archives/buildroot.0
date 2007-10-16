From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Tue, 16 Oct 2007 07:15:23 +0200
Subject: [Buildroot] AVR32 4.1.2 toolchain build issues
	[was	svncommit:trunk/buildroot: target/device
	target/device/Atmel targetetc...]
In-Reply-To: <d6cda7730710151846n722419d9t806cea6018d1b54d@mail.gmail.com>
References: <d6cda7730710140720r55bd9903s5001f0b864fe9952@mail.gmail.com>
	<02c301c80f72$254d2400$01c4af0a@Glamdring>
	<20071015221718.GA15524@reid1.localdomain>
	<059501c80f79$dd1305d0$01c4af0a@Glamdring>
	<20071015234955.GA18119@reid1.localdomain>
	<d6cda7730710151846n722419d9t806cea6018d1b54d@mail.gmail.com>
Message-ID: <1192511723.28237.2.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2007-10-16 at 02:46 +0100, Thiago A. Corr?a wrote:
> Ok.... got it to build... it happens to be that atngw100_defconfig now
> builds to a dir without nofp sufix, which makes me wonder if ppl have
> decided weather this thing has or doesn't has an FP, perhaps it's a
> paradox, or a dogma. You just have to belive it works. *smile*
> 

It does not have an FPU, probably just a bad defconfig.

> Anyway, disabled libdaemon, which I never use anyway, and now I get
> the uboot issue as well.... but at least I can work now. It should be
> easily enough to pull uboot from the Atmel AVR32 fork and figure out
> what's wrong. Dealing with packages is so much easier.
> 

The AVR32 fork has the bootloader in target/bootloader/u-boot, and is
quite different from the one in the Atmel directory.

> Btw, is there a reason why u-boot is buried into Atmel folder?
> Shouldn't other archs/chips use it as well?
> 

The AVR32 fork on atmel.no tries to do the bootloader general for all
archs.

> Hopefully I will come back with patches once more (have a better
> qtopia building, in a single stage, on the works).
> 

You can't, Qtopia hard codes the path to the libraries inside the
libraries. I have tried and ended up having to do a two stage build. One
for staging_dir and one for the target dir.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
