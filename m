From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 31 Jul 2012 13:44:35 -0500
Subject: [Buildroot] Troubles with initramfs
In-Reply-To: <20120731202629.0b748b41@skate>
References: <CAE9DZUQ+QfGcX+K_Byf1p_E2bvkP48-7CQ9Kn3jC6Vs1FepuAg@mail.gmail.com>
 <20120731202629.0b748b41@skate>
Message-ID: <CAE9DZUQBQ_Srk6HaVgk3x4S8-k5y=0fxm_0-ULV8K=MVPyJXoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> With the default Buildroot, when you enable the initramfs file format,
> it's the entire root filesystem that gets included as an initramfs into
> the kernel.

That could very well be.  It's apparently creating a default initramfs
image found under linux-<blah>/usr named initramfs_data.cpio.gz.  I
cracked it open and there's a lot of files in there.

dallasc dallasc 76142592 Jul 31 17:12 initramfs_data.cpio

> If you decided to follow Avery's suggestion (creating a separate
> initramfs that includes selected parts of the real root filesystem),
> then you should probably not use Buildroot initramfs capabilities, and
> simply configure your kernel to point CONFIG_INITRAMFS_SOURCE to your
> special initramfs.

<nod>, still intending to do that.  This was just an initial
experiment.  Looks like the linker errors came from the large size of
the initramfs and limited branching range on ARM.  I was frankly
surprised that buildroot attempts to create a default initramfs.

Moving on to creating a minimal size initramfs.
