From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 17:59:07 +0200
Subject: [Buildroot] Forcing build of custom kernel headers
In-Reply-To: <87eftxefa6.fsf@sx4173-linuxdev.solectrix.de>
References: <87eftxefa6.fsf@sx4173-linuxdev.solectrix.de>
Message-ID: <6ec78676-b577-9294-e064-3ad7c3231f01@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-07-17 17:00, Christian Kellermann wrote:
> Hi List,
> 
> I have a rather peculiar system setup: A 64 bit PPC kernel running a 32
> bit buildroot. ATM I solve this by using two default configs ? one for
> the kernel and one for the rootfs. A simple shell script copies the
> kernel artifacts back and forth so the kernel can be included in the
> rootfs image.
> 
> The kernel in question is a custom kernel tree in a git repository.
> Now some userland application needs kernel headers from that kernel. As
> I understand buildroot would install the uapi-headers into staging/
> automatically. But with my setup no kernel gets build for the 32bit
> rootfs.
> 
> I have tried to set BR2_KERNEL_HEADERS_AS_KERNEL and the respective
> CUSTOM kernel variables in my defconfig. However the build system will
> always fall back to the BR2_DEFAULT_KERNEL_HEADERS version.
> 
> So tl;dr: I want to make the linux-headers package use my custom kernel
> headers from a git repo but don?t know how to do this without building a
> kernel.

 The easiest is to check out the linux tree separately and make
LINUX_HEADERS_OVERRIDE_SRCDIR point to it.

 Regards,
 Arnout

> 
> Any thoughts?
> 
> Thanks,
> 
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
