From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 15:24:28 +0200
Subject: [Buildroot] [PATCH] board: add support for ARC AXS101 and
 AXS103 Software Development Platforms
In-Reply-To: <1438694226.22313.12.camel@synopsys.com>
References: <1438689614-31408-1-git-send-email-abrodkin@synopsys.com>
 <20150804145738.44ad2bd3@free-electrons.com>
 <1438694226.22313.12.camel@synopsys.com>
Message-ID: <20150804152428.0c0d4de7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 4 Aug 2015 13:17:06 +0000, Alexey Brodkin wrote:

> Opps dummy copy-paste from Busybox's example.
> Please pardon that silly thing.

No problem.

> Agree, that's a long-standing problem and if I'm not mistaken you guys
> advise to go for fs overlay if that kind of "feature" is required.
> 
> That said I'm not happy with that solution but having no other way I have to swallow

Yes, no problem with that.

> > Please force the version of the kernel headers, so that they match the
> > kernel being built.
> 
> Well you see the problem here is we do need yet to be released Linux v4.2
> because that's where both boards are finally exist.
> 
> So once v4.2 is released (in a couple of weeks now) and Buildroot is updated
> I would assume v4.2 headers will become default version, right?
> So then we're golden and there's no need to update these defconfigs.

You're wrong. After 4.2 becomes the default version, 4.3 will become
the default version. And then your defconfigs are broken.

So you *must* specify a custom kernel headers version. Just use 4.1,
this is good enough for a 4.2-rc kernel.

> As for kernel version itself as of today I HAVE TO specify custom version
> (v4.2-rc5) just to have sources with our boards supported. In case of Buildroot
> that means these defconfigs will be build successfully.
> 
> Still once v4.2 gets released (and I think it will happen well between some
> Buildroots RCs) I will send an update that will effectively remove 
> ----->8-----
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2-rc5"
> ----->8-----

No, you will certainly *not* send such an update, because doing this is
wrong. 4.2 might be the default version for a while, but then it will
be 4.3, and you will not have tested this.

All defconfigs *must* use a fixed version of the kernel headers, kernel
and bootloader, so that we are relatively sure that they will continue
to build and boot even if we change the default kernel headers, kernel
or bootloader versions.

Please look at all other defconfigs. The qemu_* defconfigs are good
examples of doing things right since they are nicely maintained by
Gustavo.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
