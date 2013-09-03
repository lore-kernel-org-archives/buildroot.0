From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Sep 2013 18:11:28 +0200
Subject: [Buildroot] Unable to boot via initrd
In-Reply-To: <1378148801760-50517.post@n4.nabble.com>
References: <1378148801760-50517.post@n4.nabble.com>
Message-ID: <52260A30.309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/13 21:06, Matthieu wrote:
> Hello,
>
>
> I have just installed the 2013-08 version of buildroot and I do not succed
> to boot via initrd.
> I tried two solutions (described in the previous post "Creating initrd")
> through the gui menuconfig. And neither solution seems succeed.
>
> When I run:
>
> 1) for the solultion 1 (BR2_TARGET_ROOTFS_INITRAMFS=y)
> kvm -kernel output/images/bzImage -initrd output/images/rootfs.cpio.bz2 -m
> 128

  With the initramfs option, the -initrd parameter shouldn't be needed. 
On the other hand, it shouldn't hurt either...

>
> 2) for the solution 2: (BR2_TARGET_ROOTFS_CPIO=y)
> kvm -kernel output/images/bzImage -initrd output/images/rootfs.cpio.bz2
> -initrd output/images/rootfs.cpio.bz2 -m 128

  Specifying the same initrd twice will not help much :-)

>
> I always obtain:
> VFS: Cannot open root device "(null)" .... error -6 ...
> Please append a coorect "root)" boot option; here are the available
> partitions: Kernel panic ....VFS: Unable to mount root fs on
> unknown-block(0,0)

  That's weird... With either initrd, you should never get to mounting of 
rootfs. Can you check that the rootfs contains a script called "init" in 
the root directory, that is either a symlink to /sbin/init or is a script 
that does "exec /sbin/init" at the end?


  Regards,
  Arnout

>
>
> Please can you help me?
>
> regards
>
> Matthieu
>
>
>
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Unable-to-boot-via-initrd-tp50517.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
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
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
