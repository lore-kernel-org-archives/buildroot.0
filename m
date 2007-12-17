From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 17 Dec 2007 22:33:56 +0200 (EET)
Subject: [Buildroot] Buildroot and Linux/ARM on AT91SAM9260
In-Reply-To: <85F68C4E-6290-4E64-875C-982B0E377695@oregonstate.edu>
References: <1D3F8BA5-BB0F-4306-A179-760E18E1EF63@mac.com>
	<691A7752-1681-409D-936A-9C6A7935510F@oregonstate.edu>
	<20071129133008.GB20914@real.realitydiluted.com>
	<FDBCCC91-31DB-4241-A25E-FC7DDECD2D08@oregonstate.edu>
	<6E89F2D1-2F8C-4F77-ADA8-2727407BBE6C@oregonstate.edu>
	<4766A061.7060308@promwad.com>
	<85F68C4E-6290-4E64-875C-982B0E377695@oregonstate.edu>
Message-ID: <36574.127.0.0.1.1197923636.squirrel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>
>> /sbin/init: can't Kernel panic - not syncing: Attempted to kill init!
>> load library 'libgcc_s.so.1'
>>
>> I checked that there is no libgcc_s.so.1 in rootfs image but I have
>> BR2_GCC_SHARED_LIBGCC=y
>> May be that is a cause why you not getting working rootfs.
>
>
> I'm not using a shared libgcc. It's just freezing after the freeing of
> the initrd memory about the time it should be booting up init. I guess
> my next step is to start throwing in some printk's to see exactly
> where it's dying.
>
> Of course, I can't get a 2.6.23 kernel to even boot at all, but that
> may be the same toolchain issues. My 2.6.21.6 kernel seems to be
> working ok -- that was built with my gcc 4.0.4 based toolchain, the
> only version I've been able to get successful boots from.
>
> Ryan
>
> --
> Ryan Ordway                           E-mail: rordway at oregonstate.edu
> Unix Systems Administrator               rordway at library.oregonstate.edu
> OSU Libraries, Corvallis, OR 97331    Office: Valley Library #4657
>
>

Ryan,

Yes, now I have the same symptoms
After buildroot rebuild libgcc_s.so.1 placed correctly (btw need to investigate why it was not placed there for the
first time). but when booting ramdisk is mounted and then freeze.
I suggest to try run your rootfs via qemu emulator, adjust only console device.

Folks who using ARM buildroot, please tell us your working configs!

Regards,
Ivan
