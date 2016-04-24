From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:59:38 +0200
Subject: [Buildroot] [PATCH 2/2] configs: add defconfig for TS-4800
In-Reply-To: <1461255673-11443-3-git-send-email-damien.riegel@savoirfairelinux.com>
References: <1461255673-11443-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <1461255673-11443-3-git-send-email-damien.riegel@savoirfairelinux.com>
Message-ID: <20160424235938.78800305@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Apr 2016 12:21:13 -0400, Damien Riegel wrote:
> This patch adds support for the TS-4800 SoM manufactured by Technologic
> Systems based on the Freescale i.MX515 SoC.
> 
> The TS-4800 is supported by mainline Linux as of 4.5. There are two
> patches for U-Boot. The first one modifies the default environment to
> more sane values. The second defines an errata that seems to affect the
> board. These patches will be sent upstream and hopefully they will be
> removed from Buildroot at some point.
> 
> mbrboot.bin is a MBR routine which was extracted from the image provided
> by Technologic Systems. Basically, it scans every partition with the
> 0xda type and copies the first file to a given offset, and then jump
> where the first file was copied to start its execution. In our case, we
> use it to load u-boot. This routine is loaded by the companion FPGA and
> the board won't be able to boot if this is missing.
> 
> A post-image script is provided to generate an image that can be "dd"
> directly to an SD card.
> 
> More details on the board here:
>   http://wiki.embeddedarm.com/wiki/TS-4800
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>

I think you said on IRC you would post a new version of this patch, so
I've marked this first version as "Changes Requested" in our patch
tracking system. So don't forget to send a new version, otherwise we'll
forget about it!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
