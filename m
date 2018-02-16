From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Feb 2018 23:46:19 +0100
Subject: [Buildroot] [PATCH] Sets LD_LIBRARY_PATH inside
 toolchain-wrapper.
In-Reply-To: <20180216221845.13337-1-daniel.serpell@gmail.com>
References: <20180216221845.13337-1-daniel.serpell@gmail.com>
Message-ID: <20180216234619.3b1815a6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Feb 2018 19:18:45 -0300, Daniel Serpell wrote:
> Setting the host library path in the toolchain wrapper allows moving the
> host toolchain folder to a new path, as some of the tools depends on
> buildroot provided libraries.
> 
> Signed-off-by: Daniel Serpell <daniel.serpell@gmail.com>

This is not needed. If you want to move around the host toolchain
folder, run "make sdk", which prepares the host toolchain to be a
relocatable SDK.

See slide 280 of
https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf for
more details.

And yes, we should mention this in the Buildroot manual. Patches
welcome :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
