From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 May 2021 09:09:01 +0200
Subject: [Buildroot] [PATCH v2 3/6] package/riscv64-elf-toolchain: new
 package
In-Reply-To: <20210503085733.59777dce@windsurf> (Thomas Petazzoni's message of
 "Mon, 3 May 2021 08:57:33 +0200")
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-11-thomas.petazzoni@bootlin.com>
 <87tunk2veq.fsf@dell.be.48ers.dk> <20210503085733.59777dce@windsurf>
Message-ID: <87o8ds2t0y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 03 May 2021 08:17:33 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> Out of interest, why is that? For the ARM32 case it was a question of
 >> 32bit / 64bit, but that does not seem to be the issue here?
 >> 
 >> Just crappy firmware or are there any deeper differences between a bare
 >> metal and Linux toolchain on riscv64?

 > It is not yet 100% sure what's going on. The firmware clearly doesn't
 > build with a Linux toolchain. I've done a bit of work to try to get it
 > to build, by adding -ffrestanding -nostdinc, but it does include a few
 > standard headers (stdint.h for example). Once this was fixed, the build
 > system of the firmware uses a specific gcc spec file, called nano.spec,
 > which isn't available except in their bare-metal toolchain.

 > So for now, I opened a bug report at
 > https://github.com/starfive-tech/beagle_ddrlnit/issues/4, and decided
 > to go on with building this with the recommended bare-metal toolchain.

Ok, thanks for the description.

-- 
Bye, Peter Korsgaard
