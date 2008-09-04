From: Steven Woody <narkewoody@gmail.com>
Date: Thu, 4 Sep 2008 09:50:01 +0800
Subject: [Buildroot] Login exited
In-Reply-To: <200809031950.49148.vda.linux@googlemail.com>
References: <ed4892840809010102n6293e75ejc6caf1dd57a954db@mail.gmail.com>
	<ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<200809031950.49148.vda.linux@googlemail.com>
Message-ID: <ed4892840809031850y32161b46qc99547711ab535a7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 4, 2008 at 1:50 AM, Denys Vlasenko <vda.linux@googlemail.com> wrote:
> On Tuesday 02 September 2008 02:47, Steven Woody wrote:
>> The buildroot I am using is the 080831 snapshot, the busybox is
>> 1.11.2. Now I see the boot
>> prompt finally!  But I can't login:
>>
>> ---
>> Welcome to uClibc
>> uClibc login: root
>> Dec 31 17:01:05 nlmt auth.info login[195]: root login on 'ttyS0'
>> Dec 31 17:01:05 nlmt daemon.info init: init: process '/sbin/getty -L
>> ttyS0 115200 vt100' (pid 195) exited. Scheduling for restart.
>> Dec 31 17:0
>>
>> Welcome to uClibc
>> uClibc login: default
>> Dec 31 17:01:05 nlmt daemon.info init: init: process '/sbin/getty -L
>> ttyS0 115200 vt100' (pid 195) exited. Scheduling for restart.
>> Dec 31 17:0
>> ---
>>
>> And, I got see a suspicious messages just after the kernel booted:
>> ---
>> VFS: Mounted root (cramfs filesystem) readonly.
>> Freeing init memory: 84K
>> Error -3 while decompressing!
>> c0925384(-7384812)->c3e38000(4096)
>
> Coming from kernel's fs/cramfs/uncompress.c:
>
> err:
>        printk("Error %d while decompressing!\n", err);
>        printk("%p(%d)->%p(%d)\n", src, srclen, dst, dstlen);
>        return 0;
>
>> I think I am so near to success, please help me! Thanks.
>
> Your filesystem image seems to be damaged.

Okay, we leave this 'decompressing' error for a moment.  I rebuilt
(mostly using default options from buildroot) a very small rootfs
image, 780k cramfs.  This time, it boots without the 'decompressing'
error message, I still can not login in.  It's same: whatever user
name I inputed, the getty restarted and I get nothing but another
prompt.

If you experts can not guess what's is going on here, I hope you can
tell me how to debug this kind of problem.  Tks.

> --
> vda
>
