From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 08:45:51 +0200
Subject: [Buildroot] [PATCH 1/1] configs/qemu: add
 qemu_riscv64_virt_defconfig
In-Reply-To: <cd1fb718-2f8e-571e-d217-1d37ebc73b28@mind.be>
References: <20180831143853.24340-1-mark.corbin@embecosm.com>
 <20180902214755.139a1b23@windsurf>
 <6b529ca2-bfeb-227e-e76b-0465e52d8bf0@embecosm.com>
 <cd1fb718-2f8e-571e-d217-1d37ebc73b28@mind.be>
Message-ID: <20180905084551.0e4d3e6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Sep 2018 21:57:11 +0200, Arnout Vandecappelle wrote:
> On 04/09/2018 17:14, Mark Corbin wrote:
> > I had been reluctant to add riscv-pk to Buildroot as a bootloader, as I
> > see it as an interim solution until riscv support makes it into UBoot or
> > Barebox.  
> 
>  If riscv-pk/bbl offers all the features you need, why would you use U-Boot or
> Barebox?

For the same reason that you use U-Boot or Barebox on real hardware,
rather than a completely dumb "kernel loader": shell, environment
variables, scripting, etc. I'm not saying this is always needed, but it
seems like some people like those features :-)

> > I do have a preliminary riscv-pk package working based on your helpful
> > pointers to boot-wrapper-aarch64. Do people prefer to add it as
> > 'risc-pk' when it is only the Berkeley Boot Loader part that is
> > significant? I would have added it as 'bbl', but I can see the potential
> > confusion when the package/repository is 'riscv-pk'.  
> 
>  Unless there is some convincing reason for it, we prefer to stick with the
> upstream name.

I agree. It's true that besides the BBL, there is not much in the
riscv-pk repo that would be useful in the context of Buildroot, but
riscv-pk is just as good as riscv-bbl, and riscv-pk has the advantage
of matching the upstream name.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
