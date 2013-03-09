From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Mar 2013 15:18:45 +0100
Subject: [Buildroot] Fwd: Google doesn't help Buildroot newcomers really
 much
In-Reply-To: <CAMFO433vmKwUuc6ap2654izNBpchHu7_6wzG10MisbGO9rvF6w@mail.gmail.com>
References: <CAMFO431gatpdNG5oEcAQqCWVLs6St6-0P1SBA3h3SiTimk5tvg@mail.gmail.com>
 <CAMFO433vmKwUuc6ap2654izNBpchHu7_6wzG10MisbGO9rvF6w@mail.gmail.com>
Message-ID: <20130309151845.6a7da709@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marc Schultz,

On Sat, 9 Mar 2013 12:37:12 +0100, Marc Schultz wrote:

> I'd like to make buildroot running on a similar board of BF537-STAMP. Now I
> want to change the sound device to a Cirrus Logic CS4270, but after booting
> the uImage and loading as much sound modules as I can (e.g. snd-soc-cs4270)
> "aslactl init" says that there is no sound card. Do I have to modify the
> board file "linux/linux-kernel/arch/<my_arch>/mach-<board_arch>/<board>.c"

Unfortunately, this location is completely specific to the Analog
Devices fork of Buildroot. They have forked Buildroot some time ago,
and made a number of changes that move away from the standard
Buildroot. Which means that the official Buildroot documentation may or
may not apply to Analog Devices Buildroot fork, depending on which
specific topic you look at.

We have been discussing this problematic fork with Analog Devices
people just a few days ago, and apparently, they plan to rebase their
work on Buildroot 2013.02 and then start upstreaming their changes. But
that will probably take a long time, because they made many
modifications, some of them really moving away from what we want to
have in the standard Buildroot.

> and if yes, is there a good workflow for that to prevent
> hard-to-debug-mistakes?
> 
> The ALSA-Project
> website<http://www.alsa-project.org/main/index.php/Matrix%3aModule-cs4270>
> shows
> a specific module named "snd-cs4270". Can I get this module installed by
> buildroot or do I have to download and integrate it into my target hardware
> on my own?

Your question is really a kernel development question rather than a
Buildroot question. Once you know how to make a simple modification to
your kernel sources, rebuild your kernel, and run it on your board,
then you should turn towards the ALSA SoC community to know in details
how to configure this sound codec for your board.

> I'm using the buildroot revision from
> Blackfin<http://docs.blackfin.uclinux.org/doku.php?id=buildroot:build-system:build_a_target>
> (2012.08)
> and I get this thing booting on my target hardware. Now I wanted to try the
> newest Buildroot revision (2013.05) from your website, but I always get a
> "No rule to make target `uImage'.  Stop." compiling error. Any idea what I
> might have done wrong?

Can you show us your Buildroot .config (the one used with the mainline
Buildroot) ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
