From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 May 2015 21:05:05 +0200
Subject: [Buildroot] BR 2015.02: questions re builds for a B3?
In-Reply-To: <016301d09701$da9e8e10$8fdbaa30$@novadsp.com>
References: <016301d09701$da9e8e10$8fdbaa30$@novadsp.com>
Message-ID: <20150525210505.53b449b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 May 2015 16:45:40 +0100, g4 at novadsp.com wrote:

> 2. If I configure the default kernel (3.12.10 ish) to build (specifically)
> USB gadget modules, modprobe and friends do not work on the target. The .ko
> modules are in the expected folder but somewhere a step is getting missed.
> Any thoughts?

Insufficient details. There is nothing we can say if all you provide
is "do not work". Please give more details (what happens when you
modprobe, what is your kernel configuration, etc.).

> 3. If I even need to do this by hand, how do I set up
> /etc/network/interfaces to use etho? Does this need a custom script or can
> it be added to some default file somewhere? Or, can I create an interfaces
> file in $BUILDROOT /board/beaglebone?

Please read
http://buildroot.org/downloads/manual/manual.html#rootfs-custom.

> 4. Is there an officially sanctioned way to get a complete log of all build
> steps? Redirection to stdout/stderr is a bit brittle. And I'd prefer to
> avoid hacking remake or pymake

I typically use:

	make 2>&1 | tee build.log

> 5. More generally, which .config files need to be backed up? I get
> $BUILDROOT but how about for the kernel?

Please read
http://buildroot.org/downloads/manual/manual.html#customize-store-package-config/.

> >>> linux linux-3.14.41-ti-r63 Downloading
> 
> Doing full clone
> 
> Cloning into bare repository 'linux-linux-3.14.41-ti-r63'...
> 
> remote: Counting objects: 4862708, done.
> 
> remote: Compressing objects: 100% (721124/721124), done.
> 
> remote: Total 4862708 (delta 4114542), reused 4854896 (delta 4107066)
> Receiving objects: 100% (4862708/4862708), 942.31 MiB | 294.00 KiB/s, done.
> 
> Resolving deltas: 100% (4114542/4114542), done.
> 
> Checking connectivity... done.
> 
> fatal: Not a valid object name

This means that the Git tag you're pointing to simply for the
Linux kernel doesn't exist.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
