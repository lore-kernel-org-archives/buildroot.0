From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 11 Jul 2011 11:49:21 -0700
Subject: [Buildroot] tmpfs puzzle
In-Reply-To: <201107111250.01085.minimod@morethan.org>
References: <CALo-6+iVEYuZm=Tr9opt-VOz+4ZqnGQJ8LbD-tV-dEojfdXMMA@mail.gmail.com>
 <201107111250.01085.minimod@morethan.org>
Message-ID: <CALo-6+j9oqzSrrg=UKAyUiqVtJSoaON1Q0e42CcBncVtrj2png@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am downloading and compiling the daily snapshot, thank you Michael.

One parting question.

I tried adding the incantations to /etc/fstab and /etc/inittab and on
re-booting,  when trying to mount tmpfs, I get "Invalid argument". I
am using busybox 1.18.3 and am now suspecting that something else has
changed, perhaps in busybox (or the linux kernel) with respect to the
mount command.

I am working with linux-2.6.35.12, so have advanced the linux kernel
several revisions.

I wonder if there is any comment on mount failing with "Invalid
command" with respect to either busybox or linux-2.6.35.12 while I do
wait for the compile on the daily snapshot with optimism that I will
not see this error when it is done.


On Mon, Jul 11, 2011 at 10:49 AM, Michael S. Zick <minimod@morethan.org> wrote:
> On Mon July 11 2011, Charles Krinke wrote:
>> I am puzzled why "tmpfs" is not mounting in my buildroot glibc root
>> filesystem and would appreciate a "clue" or at least a sarcastic
>> "RTFM" if one could tell me *which* "FM" and what its URL might be.
>>
>
> http://lists.busybox.net/pipermail/buildroot/2011-June/043752.html
>
> Mike
>>
>> Here is my /etc/fstab, a cat or /proc/mounts and the result of "mount
>> -a", which fails on tmpfs.
>>
>> # cat /etc/fstab
>> # /etc/fstab: static file system information.
>> #
>> # <file system> <mount pt> ? ? <type> ? <options> ? ? ? ? <dump> <pass>
>> /dev/root ? ? ? / ? ? ? ? ? ? ?ext2 ? ? rw,noauto ? ? ? ? 0 ? ? ?1
>> proc ? ? ? ? ? ?/proc ? ? ? ? ?proc ? ? defaults ? ? ? ? ?0 ? ? ?0
>> devpts ? ? ? ? ?/dev/pts ? ? ? devpts ? defaults,gid=5,mode=620 ? 0 ? ? ?0
>> tmpfs ? ? ? ? ? /tmp ? ? ? ? ? tmpfs ? ?defaults ? ? ? ? ?0 ? ? ?0
>> sysfs ? ? ? ? ? /sys ? ? ? ? ? sysfs ? ?defaults ? ? ? ? ?0 ? ? ?0
>> #
>> #
>> # cat /proc/mounts
>> rootfs / rootfs rw 0 0
>> /dev/root / jffs2 rw,relatime 0 0
>> devtmpfs /dev devtmpfs rw,relatime,mode=0755 0 0
>> proc /proc proc rw,relatime 0 0
>> devpts /dev/pts devpts rw,relatime,gid=5,mode=620 0 0
>> sysfs /sys sysfs rw,relatime 0 0
>> #
>> #
>> #
>> # mount -a
>> mount: mounting tmpfs on /tmp failed: Invalid argument
>> #
>>
>>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Charles Krinke
