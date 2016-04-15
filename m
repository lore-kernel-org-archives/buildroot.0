From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 21:21:17 +0200
Subject: [Buildroot] [PATCH] configs: add Armadeus Systems APF6 SOM
 basic support
In-Reply-To: <57110CA1.3050101@free.fr>
References: <1460641197-12610-1-git-send-email-julien.boibessot@free.fr>
 <20160415095435.7ac98177@free-electrons.com>
 <5710FB65.6080403@free.fr>
 <20160415171741.0f2f29cc@free-electrons.com>
 <57110CA1.3050101@free.fr>
Message-ID: <20160415212117.3e910331@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 17:45:37 +0200, Julien Boibessot wrote:

> cf my previous RFC/PATCH commented by Arnout yesterday evening
> (https://patchwork.ozlabs.org/patch/610481/):
> we need to download patches to build U-Boot and BR dl infra complains
> about missing hash.

Then you should send a series of patches, with the first patch fixing
the U-Boot hash issue, and the second patch adding the APF6 defconfig
with U-Boot support.

This way, we can clearly see the big picture and the dependencies
between your contributions.

> Well for me no. eMMC are physically partionned and I don't think you can
> flash a big file with everything inside.
> I don't remember with who I had this discussion during BRDD on February :-)
> Internally we use genimage to build a kernel+rootfs image for "user
> dat"a partition of our eMMC but it's only for factory purpose and I'm
> not sure I have to complicate the defconfig for something no one uses.
> Should I ?
> (http://www.armadeus.com/wiki/index.php?title=EMMC)

OK. Having a genimage generated image for the "user data" part still
makes sense IMO.

> > In any case, you should include a readme.txt that documents how to
> > flash the resulting system on the board.
> 
> yeap that's the goal of the patch I sent this afternoon:
> https://patchwork.ozlabs.org/patch/610964/
> Once accepted, I will update it in next version on my APF6 patch.

Same thing, it would be a lot better if you were doing patch series
rather than individual patches that seem to be unrelated, but are in
fact inter-related.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
