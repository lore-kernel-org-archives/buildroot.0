From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 21:41:38 +0200
Subject: [Buildroot] Running Weston on stm32mp157c-dk2
In-Reply-To: <CAOiXNkAk0ZJjBAAG2koBGs+kmnYXEHOQubxMpcf8+yuJYMLDwg@mail.gmail.com>
References: <CAOiXNkAuzbY-8VLckB71VgamhH9i80CK3TX0TGLLj0z_0iTygQ@mail.gmail.com>
 <20200909221101.327887ca@windsurf.hq.k.grp>
 <CAOiXNkAW-_HZPMGzZSezjNDu=wyKN6eiiokfOXBkBaAce+SMLg@mail.gmail.com>
 <20200910114133.43bb3e53@windsurf.hq.k.grp>
 <CAOiXNkCVYCW=rf6pN5-e0D7NZWhoOry0ZwtPDEOPna_4G2ss6g@mail.gmail.com>
 <CAOiXNkDBjvTj=ND=qVvaz+vk2H8LBiE3dm0HCFK=9a+Y8NBf1A@mail.gmail.com>
 <20200914132101.536ed541@windsurf.home>
 <CAOiXNkAk0ZJjBAAG2koBGs+kmnYXEHOQubxMpcf8+yuJYMLDwg@mail.gmail.com>
Message-ID: <20200915214138.0982c8cf@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 21:32:46 +0200
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> I am using my defconfig which is slightly modified
> stm32mp157c_dk2_defconfig (mainly added some packages). Kernel-related
> things are the same as in original stm32mp157c_dk2_defconfig:
> 
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.26"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_P2_PATH)/board/stm32mp157c-dk2-dev/linux.config"
> 
> So it is vanilla kernel.
> 
> Are you eventually aware about any activities from STM or whoever else
> to integrate required changes in mainline kernel/Buildroot? I would be
> glad to help but not sure that I have enough knowledge to do it on my
> own.

It's not about "integrating changes in mainline kernel", because the
mainline kernel doesn't accept kernel code to support closed-source
OpenGL implementations.

What however could be done is to fix the build of the out-of-tree
kernel module that is provided in gcnano-binaries, so that it works
with an upstream kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
