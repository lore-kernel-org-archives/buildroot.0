From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jul 2018 23:02:41 +0200
Subject: [Buildroot] BR2_LINUX_KERNEL_PATCH for linux-headers
In-Reply-To: <fea35efb-0134-f091-5cbd-30292f137b33@gmail.com>
References: <fea35efb-0134-f091-5cbd-30292f137b33@gmail.com>
Message-ID: <60e837dd-e80e-c0c3-a5b4-7cb60e87f7f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-18 16:32, Serj Kalichev wrote:
> Hello.
> 
> Both linux and linux-headers package use BR2_LINUX_KERNEL_PATCH. But
> BR2_LINUX_KERNEL_PATCH is available if BR2_LINUX_KERNEL is selected. I want to
> build toolchain only. And don't want to build linux kernel. So I deselect
> BR2_LINUX_KERNEL and lose BR2_LINUX_KERNEL_PATCH for linux-headers.
> 
> I think BR2_LINUX_KERNEL_PATCH must not depend on BR2_LINUX_KERNEL.

 It's not easy to do that properly, because you'd still need to go to the kernel
menu to set the kernel patch list.

 Anyway, we consider BR2_LINUX_KERNEL_PATCH as deprecated. Use
BR2_GLOBAL_PATCH_DIR instead, and add your patches in the linux-headers
subdirectory of that directory.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
