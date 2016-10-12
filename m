From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Oct 2016 00:34:04 +0200
Subject: [Buildroot] initramfs is not being linked into kernel
In-Reply-To: <CAChFQ9QOe0BNc-AcZO1AYENwbWup9ss2PVj42h3Rqncwx7tQgw@mail.gmail.com>
References: <CAChFQ9TE=2_k0xH2UwHBGOgkynMMASnuQ-xApx3v+xGFWCcsiQ@mail.gmail.com>
 <CAChFQ9QOe0BNc-AcZO1AYENwbWup9ss2PVj42h3Rqncwx7tQgw@mail.gmail.com>
Message-ID: <a69f5bc3-a82e-c2a5-fb60-66cab28924a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-10-16 12:39, Adam Baxter wrote:
> Hi all,
> 
> I've got the following external / overlay build setup
> - https://github.com/baxterworks-build/buildroot-skeleton. BR2_TARGET_ROOTFS_INITRAMFS=y
> is set, however the resulting bzImage doesn't have the rootfs linked into it.
> This is more evident on the selfhost branch, where I do silly things like add a
> complete set of compilers to the rootfs - in this case, rootfs.cpio is 40
> megabytes, but bzImage is 2 megabytes.
> 
> Relevant
> files: https://github.com/baxterworks-build/buildroot-skeleton/blob/master/external/configs/skeleton_defconfig
> and https://github.com/baxterworks-build/buildroot-skeleton/blob/master/external/configs/kernel.config

 It seems to work for me (with a slightly modified buildroot config though) on
current git master, and there are no relevant changes since 2016.08.

 Do you have this with a clean build, or only when you do a rebuild? Although
the latter really shouldn't make a difference... Is the
output/build/linux-4.7.2/.stamp_initramfs_rebuilt file created and up-to-date?
Does output/build/linux-4.7.2/initramfs_data.cpio.gz look correct? initramfs_data.o?


 Regards,
 Arnout

> 
> I am building with 2016.08. Building with git HEAD appears to create an
> unbootable kernel, but that's a story for another thread.
> 
> Any ideas why I can't get the initramfs to be linked in?
> 
> Thanks,
> Adam
> 
> 
> 
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
