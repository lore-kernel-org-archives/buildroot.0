From: Steven Woody <narkewoody@gmail.com>
Date: Tue, 2 Sep 2008 18:27:34 +0800
Subject: [Buildroot] Still "Can't open /dev/tty1[2,3]", Please HELP
In-Reply-To: <MJEBLBOLLBKOACLOGNPBEEIHCBAA.e.krueper@solcon-systemtechnik.de>
References: <ed4892840809011839w2b021ec5v26159eefa8389e41@mail.gmail.com>
	<MJEBLBOLLBKOACLOGNPBEEIHCBAA.e.krueper@solcon-systemtechnik.de>
Message-ID: <ed4892840809020327s1f9447e4g4cf60ce2920d2e10@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 2, 2008 at 2:24 PM, Emil Kruper
<e.krueper@solcon-systemtechnik.de> wrote:
>>But I still like to know what you mentioned 'device table'. I want to
>>ask, what is and where is the 'device table'?  I dont find the
>>concepts in buildroot on-line doucments.  Thanks.
>
> Have a look at target/generic/device_table.txt and
> target/generic/mini_device_table.txt.

sorry for the stupid ... I append the exact file with the folllowing line
  /usr/local              d       755     0       0       -       -
   -       -       -
to ensure the target/generic/device_table.txt really works.  But after
full build, I don't find /usr/local under the root. So,,,  what
'device_table.txt' should I go to use?

> You define by the buildroot config which file is used to generate the
> targets device table.

Where is the definition for the target device table file name?  Thanks.

>
> Best regards
>
> Emil Kruper
>
> Von: buildroot-bounces at uclibc.org
> [mailto:buildroot-bounces at uclibc.org]Im Auftrag von Steven Woody
> Gesendet: Dienstag, 2. September 2008 03:40
> An: buildroot at uclibc.org
> Betreff: Re: [Buildroot] Still "Can't open /dev/tty1[2,3]", Please HELP
>
>
> On Tue, Sep 2, 2008 at 8:58 AM, Hamish Moffatt <hamish@cloud.net.au> wrote:
>
>> I couldn't work out where your target_skeleton and device table are
>> coming from based on your config. Do you have a device table, and does
>> it have those /dev/tty1,2,3,4 devices?
>
> The problem had gone away after I add udev to the packages.  I am not
> sure whether the absence of udev is really the reason that cause the
> previous "can't open /dev/tty?" problems.
>
> But I still like to know what you mentioned 'device table'. I want to
> ask, what is and where is the 'device table'?  I dont find the
> concepts in buildroot on-line doucments.  Thanks.
>
>>
>> Maybe you could post the output of the build process.
>>
>>> VFS: Mounted root (cramfs filesystem) readonly.
>>> Freeing init memory: 84K
>>> mkdir: cannot create directory '/dev/pts': Read-only file system
>>> mount: mounting devpts on /dev/pts failed: No such file or directory
>>
>> Your inittab is obviously trying to make directories in a read-only file
>> system which isn't going to work. Not that it's related.
>>
>
> Yes, you are right. I did not notice it at first time.  But it was
> corrected.
>
> You may see in my another post, I now can get the login prompt, and my
> problem switchs to "Why I can not login". I hope I can get your help
> in that thread.
>
> Best Regards,
> narke
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
