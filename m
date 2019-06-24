From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 Jun 2019 13:57:51 +0800
Subject: [Buildroot] [PATCH] configs/csky_gx6605s: bump kernel to 5.0
 and use buildroot toolchain
In-Reply-To: <20190624055207.59b0c7bf@windsurf>
References: <1561347693-16089-1-git-send-email-guoren@kernel.org>
 <20190624055207.59b0c7bf@windsurf>
Message-ID: <CAJF2gTTD2DJtRUX402LAR5wsgCbb7GwvfGLxMDcEkrhdMJNHXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Jun 24, 2019 at 11:52 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 24 Jun 2019 11:41:33 +0800
> guoren at kernel.org wrote:
>
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > The most thing is to use the toolchain compiled by buildroot itself. And
> > we also bump kernel to 5.0 with kernel.org.
> >
> > For all 610s including qemu we use 0x10000000 PHYS_OFFSET for unified
> > maintain.
>
> I'm not sure what you mean by "unified maintain". How does it matter,
> considering that the Buildroot defconfig is anyway for one single
> platform ?
PHYS_OFFSET change need re-compile the vmlinux, because csky only
could align 512MB for dynamical. We define PHYS_OFFSET 0x10000000
here, then we could also boot the same vmlinux with both qemu and
gx6605s.

>
> > There is no gx6605s.dts for the config, so we need wget it from
> > csky gitlab CI storage.
>
> Meh, this is not great. Is the Gitlab CI URL really permanent? Jobs
> artifacts are usually removed after a configurable time, isn't it the
> case as well for this artifact ?
Seems it could be permanent, I use the 'keep' buttom on the gitlab job page.

>
> Also, why isn't this .dts not submitted to the upstream Linux kernel ?
I prepare to do that, but it need wait next linux kernel version to support it.

>
> Overall, I think I would prefer to see a patch to the Linux kernel in
> board/csky/ rather than downloading a random .dtb. Or just have
> the .dts file directly in board/csky/.
A .dts file directly in board/csky is also OK for me and I'll do that
in next version patch.

>
> For the record, DT is not about "config", it's about describing the
> hardware. You might give the DT kernel maintainers a heart attack if
> you call the DT "configuration"! :-)
Got it, DT is the DT, and config is the config, they are different.

But, my sentence:
origin: There is no gx6605s.dts for the config ...
correct: There is no gx6605s.dts in the buildroot config ...
That's what I mean, sorry for bad grammer :)

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
