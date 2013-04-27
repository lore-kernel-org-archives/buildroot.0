From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Sat, 27 Apr 2013 19:53:20 +1000
Subject: [Buildroot] initramfs doesn't get linked into kernel
In-Reply-To: <20130427031758.363b222f@skate>
References: <klf34k$81s$1@ger.gmane.org> <20130427031758.363b222f@skate>
Message-ID: <klg76d$b42$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> If you let Buildroot build your kernel, it does that automatically (see
> the code in linux/linux.mk). If you build your kernel outside of
> Buildroot, you have to set CONFIG_INITRAMFS_SOURCE correctly.
>
> If you build your kernel outside of Buildroot, pointing
> CONFIG_INITRAMFS_SOURCE to the .cpio image works just fine. I'm doing
> that all the time here.

Ahh ok, so what I did should have worked then.  Since then I have added 
Ethernet support for my board and tried booting with a root filesystem on NFS. 
  This worked (it mounted the filesystem) but it doesn't seem to be able to 
run the init binary (in this case Busybox built by buildroot.)  Looking at 
tcpdump it correctly follows the symlinks and appears to download the busybox 
binary, but then fails saying it couldn't find init.

I'm not quite sure what the problem is (I'm wondering whether it's a 
compatibility issue like OABI vs EABI or something) but it's possible this is 
what was causing the apparent initramfs failure, since it's the same 
filesystem (I just unzipped the .tar of the root filesystem that buildroot 
generated, into the NFS share.)  I built the kernel with and without EABI 
support though and there was no difference, so I'm not really sure what it 
might be.

I'll keep looking into the problem until I'm able to boot with root on NFS, 
then I'll try initramfs again to see if that works, and report back.

Thanks again,
Adam.
