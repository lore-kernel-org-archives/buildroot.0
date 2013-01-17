From: Willy Lambert <lambert.willy@gmail.com>
Date: Thu, 17 Jan 2013 14:10:26 +0100
Subject: [Buildroot] Udev generates too many tty dev nodes
In-Reply-To: <3906424.A8B2AW86f2@sagittae>
References: <CAKvQZ_2FEFO7BNqkzXTCeH5+scxg6ZhuW+Ruy99Q8xxivjhx_w@mail.gmail.com>
 <3906424.A8B2AW86f2@sagittae>
Message-ID: <CAKvQZ_35WsbQpNREP9gmNKSj3b0Aqk8OBC+MY7D5EVuAaDC6HQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/1/17 J?r?me Pouiller <jezz@sysmic.org>:
> On Thursday 17 January 2013 01:48:41 Willy Lambert wrote:
>> Hi all,
> Hi,
>
>> I'm trying to put my /dev folder into order, and I recently switched
>> from static config to udev. All device are correctly set up exept tty*
>> that are umerously present (something like 64 nodes).
>>
>> _ Does anyone know if it is normal that so many files are generated ?
>> (or said differently should I wonder about my buildroot outputs)
>> _ Is there any mean to change that ?
>> _ Is this only and udev problem or is it linked to buildroot integration ?
> Udev only create devices declared by kernel. So this setting is somewhere in
> kernel configuration.
>
>
>> I think it's a quite "common problem" but googling it didn't helped :(
>> The better answer was that :
>> http://unix.stackexchange.com/questions/25021/change-the-number-of-generated
>> -dev-tty-devices but it's a bit hackish... I generate a rootfs from scratch
>> so I want to manage everything that's happening inside, so in this case I
>> want to tell it how many device it may/should create.
> It looks, there is no configuration entry to change this setting.
> Nevertheless, you can try to change MAX_NR_CONSOLES from linux/vt.h.
>
> BR,
>

Hum... Thanks for pointing. I'll have a look. I had a quick look on
different machines with different distributions (Debian, Ubuntu,
Fedora) the don't behave equally. Debian is "clean", the other also
have plenty of devices for tty*

In the past there were a NR_TTY_DEVICES kernel config option (cf
http://lkml.indiana.edu/hypermail/linux/kernel/0404.2/1316.html), but
I can't find it anymore.

I'd better not modify the kernel sources. I don't care about
configuration, but change sources is a step ahead that I don't want to
do.

> --
> J?r?me Pouiller
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
