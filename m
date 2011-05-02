From: Carlos Alberto Diaz Gonzalez O. <cadgo.root@gmail.com>
Date: Sun, 1 May 2011 22:02:52 -0500
Subject: [Buildroot] Strange behavior in mount with tmpfs
In-Reply-To: <20110502023445.GB31443@tarshish>
References: <BANLkTi=YPFQWBKV9L1EZR-PwxfubcNARPg@mail.gmail.com>
	<20110502023445.GB31443@tarshish>
Message-ID: <BANLkTim7yaFS7T_v9yFJ_oA0xwvxO4svUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch
Thanks for your help, yes you have reason it was related with the system links.

Thanks

Regards

2011/5/1 Baruch Siach <baruch@tkos.co.il>:
> Hi Carlos,
>
> On Sun, May 01, 2011 at 09:12:03PM -0500, Carlos Alberto Diaz Gonzalez O. wrote:
>> Hi Everybody,
>> I?m testing buildroot for a personal project and is a really good tool
>> thanks to all people that is doing it possible.
>> At this moment I?m testing in a virtual machine a filesystem built
>> with buildroot , but I?m observing an odd behavior when I try to mount
>> some tmpfs all of these are being mounted in the /tmp, although my
>> fstab is configured to mount in other way this filesystems
>
> Are your /var/run, /var/tmp, etc, all symlink to /tmp? This should explain
> what you see.
>
> baruch
>
>> Maybe someone in this list can help me to find an answer to fix it or
>> a way to correct it. The version used to build my environment was the
>> buildroot-2011.02.
>>
>> # cat /etc/fstab
>> # /etc/fstab: static file system information.
>> # <file system> <mount pt> ? ? <type> <options> ? ? ? ? <dump> <pass>
>> /dev/sda5 ? ? ? / ? ? ? ? ? ? ?ext3 ? rw,noauto ? ? ? ? 0 ? ? ?1
>> /dev/sda6 ? ? /etc ? ? ? ? ? ext3 ? ? rw,auto,nodev,noexec,remount 0 ?0
>> proc ? ? ? ? ?/proc ? ? ? ? ?proc ? ? defaults ? ? ? ? ?0 ? ? ?0
>> devpts ? ? ? ? ? ? ? ?/dev/pts ? ? ? devpts ? defaults,gid=5,mode=620 ? 0 ? ? ?0
>> sysfs ? ? ? ? /sys ? ? ? ? ? sysfs ? ?defaults ? ? ? ? ?0 ? ? ?0
>> tmpfs /var/run ? ? ? ?tmpfs ? rw,size=128k,nodev,nosuid ?0 ? 0
>> tmpfs /var/tmp ? ? ? ?tmpfs ? defaults ? ? ? ?0 ? 0
>> tmpfs /var/log ? ? ? ?tmpfs ? rw,size=20m,nodev,nosuid ?0 ? 0
>> tmpfs /var/lock ? ? ? tmpfs ? rw,nodev,nosuid ?0 ? 0
>>
>> # mount
>> rootfs on / type rootfs (rw)
>> none on /sys type sysfs (rw,nosuid,nodev,noexec)
>> none on /proc type proc (rw,nosuid,nodev,noexec)
>> udev on /dev type tmpfs (rw)
>> none on /dev/pts type devpts (rw,nosuid,noexec,gid=5,mode=620)
>> fusectl on /sys/fs/fuse/connections type fusectl (rw)
>> /dev/sda5 on / type ext3 (rw,errors=continue,data=ordered)
>> /dev/sda6 on /etc type ext3 (rw,errors=continue,data=ordered)
>> tmpfs on /tmp type tmpfs (rw,nosuid,nodev)
>> tmpfs on /tmp type tmpfs (rw)
>> tmpfs on /tmp type tmpfs (rw,nosuid,nodev)
>> tmpfs on /tmp type tmpfs (rw,nosuid,nodev)
>
> --
> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ~. .~ ? Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
> ? - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
