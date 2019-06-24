From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jun 2019 05:52:07 +0200
Subject: [Buildroot] [PATCH] configs/csky_gx6605s: bump kernel to 5.0
 and use buildroot toolchain
In-Reply-To: <1561347693-16089-1-git-send-email-guoren@kernel.org>
References: <1561347693-16089-1-git-send-email-guoren@kernel.org>
Message-ID: <20190624055207.59b0c7bf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jun 2019 11:41:33 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> The most thing is to use the toolchain compiled by buildroot itself. And
> we also bump kernel to 5.0 with kernel.org.
> 
> For all 610s including qemu we use 0x10000000 PHYS_OFFSET for unified
> maintain.

I'm not sure what you mean by "unified maintain". How does it matter,
considering that the Buildroot defconfig is anyway for one single
platform ?

> There is no gx6605s.dts for the config, so we need wget it from
> csky gitlab CI storage.

Meh, this is not great. Is the Gitlab CI URL really permanent? Jobs
artifacts are usually removed after a configurable time, isn't it the
case as well for this artifact ?

Also, why isn't this .dts not submitted to the upstream Linux kernel ?

Overall, I think I would prefer to see a patch to the Linux kernel in
board/csky/ rather than downloading a random .dtb. Or just have
the .dts file directly in board/csky/.

For the record, DT is not about "config", it's about describing the
hardware. You might give the DT kernel maintainers a heart attack if
you call the DT "configuration"! :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
