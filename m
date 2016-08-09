From: Chetan Kumar <shivakumar.chetan@gmail.com>
Date: Tue, 9 Aug 2016 07:31:24 +0100
Subject: [Buildroot] init do not start on rpi-3
In-Reply-To: <C3931D1C-6B60-42EC-B6B7-172652CCA674@gmail.com>
References: <CALtfCQZntOzpr5UZr9ayBcPBwXT2SDa+Z_CtNNcFCUX-H41jOw@mail.gmail.com>
 <CAFN-Ez76kdXFyagpCzmTteQCeShs4dMAs9o9=bhGJV+S+LdVcw@mail.gmail.com>
 <C3931D1C-6B60-42EC-B6B7-172652CCA674@gmail.com>
Message-ID: <CAFN-Ez6wVHHQVNa9KSqSFfps83o2j7Yk-APJFXyFAmbCcwjVyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

No, I do not see that, this is also is default content, pasted below
uncommented lines

kernel=zImage
disable_overscan=1
gpu_mem_256=100
gpu_mem_512=100
gpu_mem_1024=100

Thanks
C

On Tue, Aug 9, 2016 at 7:27 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Aug 8, 2016, at 11:23 PM, Chetan Kumar <shivakumar.chetan@gmail.com>
> wrote:
>
> Hi,
>
> No changes, used the standard contents. For trial, I had apended
> init=/bin/sh in cmdlne.txt once, that was removed later
>
> ============begin inittab===============
> # Startup the system
> ::sysinit:/bin/mount -t proc proc /proc
> ::sysinit:/bin/mount -o remount,rw /
> ::sysinit:/bin/mkdir -p /dev/pts
> ::sysinit:/bin/mkdir -p /dev/shm
> ::sysinit:/bin/mount -a
> ::sysinit:/bin/hostname -F /etc/hostname
> # now run any rc scripts
> ::sysinit:/etc/init.d/rcS
>
> # Put a getty on the serial port
> console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
> tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console
>
> # Stuff to do for the 3-finger salute
> #::ctrlaltdel:/sbin/reboot
>
> # Stuff to do before rebooting
> ::shutdown:/etc/init.d/rcK
> ::shutdown:/sbin/swapoff -a
> ::shutdown:/bin/umount -a -r
> ==========end inittab==================
>
> =========begin cmdline.txt==============
> root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
> ==========end cmdline.txt===============
>
>
> Check config.txt in boot area and see if you have
>
> enable_uart=1
>
> or not
>
>
> Thanks
> C
>
> On Tue, Aug 9, 2016 at 7:15 AM, Oscar Gomez Fuente <oscargomezf@gmail.com>
> wrote:
>
>> Hi,
>>
>> Could you send us the content of the following files: cmdline.txt file
>> and /etc/inittab?
>>
>> Best regards.
>>
>> Oscar Gomez Fuente.
>>
>>
>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160809/14712765/attachment.html>
