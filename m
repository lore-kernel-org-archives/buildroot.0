From: =?UTF-8?B?0JjQu9GM0Y8g0JLQsNC70LXQtdCy?= <ilya-valeev@yandex.ru>
Date: Thu, 19 May 2016 00:57:09 +0500
Subject: [Buildroot] How to choose C library dependencies
In-Reply-To: <20160516231922.7ebb515f@free-electrons.com>
References: <5731B0DD.1080201@gmail.com>
 <9f06d929-7f0c-7461-d6b2-c85b46515c4d@yandex.ru>
 <4904ae0d-f790-063e-a365-675596985f02@mind.be>
 <20160516231922.7ebb515f@free-electrons.com>
Message-ID: <3932dff2-fc57-37aa-87dd-d7d714166250@yandex.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

How to use your method? (or where can I search for explanation?)


17.05.2016 02:19, Thomas Petazzoni ?????:
> Hello,
>
> On Sun, 15 May 2016 01:54:07 +0200, Arnout Vandecappelle wrote:
>
>>> I want to compile ejabberd and run it on my router. I choose erlang package with
>>> SMP support and all modules and ejabberd package, does not configure defconfig.
>>> Then I run /make ejabberd/, copy ejabberd, erlang and busybox from /target/
>>> folder to router and run it.  
>>   Buildroot in't really meant for that kind of scenario. That said, it should be 
>> possible to do it. Basically you must create a toolchain that matches exactly 
>> with what is already installed on the target.
> Or:
>
>  1/ Use a statically linked binary.
>
>  2/ Use a chroot.
>
> In both cases, you must make sure that the C library uses kernel
> headers that are at least as old at the kernel running on your target.
>
> Thomas

-- 
????????????? ????????? ?????: 1D38C8C9
?????????: 6210 01B6 A34E E490 A9E4  87DD 841D 0ABE 1D38 C8C9

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160519/c8876e79/attachment.html>
