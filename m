From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:00:00 +0200
Subject: [Buildroot] [PATCH] board/olpc: add readme.txt
In-Reply-To: <20200419083923.595749-1-lkundrak@v3.sk>
References: <20200419083923.595749-1-lkundrak@v3.sk>
Message-ID: <20200419150000.23143429@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 10:39:23 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> This adds some instructions on how to build and run images for the OLPC
> XO laptops.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Thanks, I've applied, after changing one small thing, see below.

> +  $ make olpc_xo1_defconfig   # Configure for XO-1
> +  $ make olpc_xo175_defconfig # Configure for XO-1.75
> +  $ make menuconfig           # Customize the build configuration
> +  $ make                      # Build

Changed to:

===

  $ make olpc_xo1_defconfig   # Configure for XO-1

or:

  $ make olpc_xo175_defconfig # Configure for XO-1.75

Then:

  $ make menuconfig           # Customize the build configuration
  $ make                      # Build

===

Indeed, the two make <foo>_defconfig commands could have been confusing
for a newcomer. I made it explicit that you want to do one or the
other, not both.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
