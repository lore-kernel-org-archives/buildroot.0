From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Jun 2016 00:27:04 +0200
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
 menuconfig
In-Reply-To: <20160627205746.GC3714@free.fr>
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
Message-ID: <045f11b5-1c4c-5082-d138-406559792a72@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-06-16 22:57, Yann E. MORIN wrote:
[snip]
> And looking at the commit that introduced it for linux, it is exactly
> the case that would have been covered by an override-srcdir:
> 
>     commit 73da2ff6f718f2889e3c5024d899f8d58f502863
>     Author: Rafal Fabich <rafal.fabich@gmail.com>
>     Date:   Sat Feb 23 19:03:30 2013 +0100
> 
>         Added local directory as source of kernel code
>     
>         Add the option to use a local directory as the source for
>         building the Linux kernel, which can be useful during
>         kernel development.
>     
>         Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>
>         Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>         Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>         Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> Peter, any reason that you applied this patch at the time?
> Arnout, anything you remember for giving your ACK?

 I think at the time I considered using _OVERRIDE_SRCDIR for something like this
too clunky. However, now I'm more convinced that every realistic project should
have an automatic _OVERRIDE_SRCDIR for everything in $(BR2_EXTERNAL)/src. So
then indeed this option is not so relevant anymore.

 It's still a bit clunky, though, that your (def)config has to specify
_something_ for the kernel version, but that it will never be used in practice.

 I propose to reject this patch but keep the existing LINUX_CUSTOM_LOCAL around
for a bit still.

 Regards,
 Arnout

> 
> So, I would think that:
>   1- we don't want this for U-Boot;
>   2- we should drop it for Linux.
> 
> Peter, Thomas, Arnout: what do you think?
[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
