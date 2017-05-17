From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 21:29:03 +0200
Subject: [Buildroot] RPi B+ update
In-Reply-To: <24ea86ee-9b48-816f-3e7a-6d5a985ea339@gmail.com> (Marco
 Trapanese's message of "Wed, 17 May 2017 17:28:26 +0200")
References: <38b2ad6e-f9bd-c0f7-e5be-c0531fd22f2a@gmail.com>
 <20170516232354.2080bf15@gmx.net>
 <224ff827-03b8-16d6-34fd-8be05cea607d@gmail.com>
 <24ea86ee-9b48-816f-3e7a-6d5a985ea339@gmail.com>
Message-ID: <87fug35lkw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marco" == Marco Trapanese <marcotrapanese@gmail.com> writes:

Hi,

 > Well, some good news. 
 > Using the latest versions of buildroot (2017.05-rc1-00062-g4b4fc27)
 > and kernel (4.9.21) I built an "empty" environment (without any
 > additional package but the rpi-firmware). Copying both zImage and the
 > fw files into the boot partition of the existing sd-card, leads to
 > boot-up again!

Great!

 > The problem now is related to the kernel drivers (wifi, rtc, cdc,
 > etc...) that I manually selected using make linux-menuconfig and that
 > were available (in the old rootfs) under /lib/modules/3.12.26. I'm
 > afraid the new kernel doesn't know where to find them - and perhaps it
 > cannot use them anyway because they are related to a different
 > version.

Yes, reusing the old kernel drivers with a new kernel is not going to
work.

 > It seems I need to update the whole system...

Unless the system boots with new fw and the old zImage. Did you try that
combination?


-- 
Bye, Peter Korsgaard
