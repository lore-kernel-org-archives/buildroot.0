From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2011 15:28:41 +0200
Subject: [Buildroot] Slow boots caused by
 ca520507fc15a8213334a76339a3e6d567e91ea0 (udev, inittab)
In-Reply-To: <BANLkTi=cikrdVk_mikRhpLYZtgDarZCukw@mail.gmail.com>
References: <BANLkTi=cikrdVk_mikRhpLYZtgDarZCukw@mail.gmail.com>
Message-ID: <20110517152841.2da7be8c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 May 2011 16:19:36 +0300
Diego Iastrubni <diegoiast@gmail.com> wrote:

> I am seeing that my boot is now ~60 seconds, and hte boots hangs ~40 secs
> while starting udev.
> 
> This is caused by ca520507fc15a8213334a76339a3e6d567e91ea0 which claims that
> /sys/ and friends are moutned by inittab. I found no such code in the
> ininttab installed is my unit,  and the inittab available in the head
> (59af9a8..ce1ae87)  in fs/skeleton/etc/inittab does not mount /sys/ at boot
> time. Reverting the inittab to the one before this change fixes the boot
> time.

Well inittab does "mount -a" and /etc/fstab says that sysfs should be
mounted.

Moreover the ca520507fc15a8213334a76339a3e6d567e91ea0 you're pointing
did not change the inittab, so I don't know how reverting could modify
the inittab. Are you referring to the udev startup script ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
