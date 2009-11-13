From: Bogdan Cristea <cristeab@gmail.com>
Date: Fri, 13 Nov 2009 16:46:42 +0200
Subject: [Buildroot] Creating a filesystem for QEMU
In-Reply-To: <a038bef50911130559i31605c47k57d27e91d95b28f8@mail.gmail.com>
References: <200911121623.45929.cristeab@gmail.com>
	<200911131518.14509.cristeab@gmail.com>
	<a038bef50911130559i31605c47k57d27e91d95b28f8@mail.gmail.com>
Message-ID: <200911131646.42695.cristeab@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 13 November 2009 15:59:46 you wrote:
> On Fri, Nov 13, 2009 at 8:18 AM, Bogdan Cristea <cristeab@gmail.com> wrote:
> > On Thursday 12 November 2009 16:46:32 you wrote:
> >> I've just started doing the same thing myself.  After a bit of googling
> >> the trick I found was to ask buildroot to generate a cpio target file
> >> system. Start with the i386_defconfig or i686_defconfig and set
> >> BR2_TARGET_ROOTFS_CPIO=y (or use "make menuconfig" an find the cpio
> >> option under the "Target file system" menu)
> >>
> >> Making use of qemus ability to replace the bootloader you can invoke
> >> qemu with
> >>     qemu -kernel output/images/bzImage \
> >>          -initrd output/images/rootfs.i686.cpio
> >
> >     I have tried this approach, but it does not seem to work. First
> > inconvenient is that rootfs.i686.cpio file is very large (600 MB) and
> > when using the above command I only get a black screen from QEMU while
> > the entire computer seems to be slower.
> >    Lionel, suggested other approaches but till now I have no luck. Trying
> > to obtain first a cloop root filesystem and then convert that to a QEMU
> > format seem to work and the file size is small (3 MB), but still when
> > using that disk image, QEMU is not able to recognize any root partition.
> >    If you have any other suggestion it would be helpful.
> 
> I'd double check your configuration. I must admit I started hacking
> away without looking at the i686_defconfig. But I've got a rootfs
> thats only 3M and a kernel thats just under 4M. I've attached my
> buildroot config (.config) and kernel config (i386_defconfig) for your
> reference.
> 
> Also when you are hacking away re-configuring buildroot doesn't know
> to remove something up if you've de-selected it so you may need to
> manually clean out output/target/ manually (or start from fresh each
> time).
> 

when using your .config file my compilation fails due to a missing patch file
mpfr-2.4.1.patch. What is the role of that patch ?
