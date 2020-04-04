From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Apr 2020 13:41:34 +0200
Subject: [Buildroot] [Question] How do I build source code at source
 folder?
In-Reply-To: <CAF6vTZZctgOOnqcseZ5-UVGQbg2baC8Le4qazOZ2rFpdH_3tcw@mail.gmail.com>
References: <1585904837068-0.post@n4.nabble.com>
 <CAEyMn7bt=wUY=RLDSE=QAD8F+ap5K4rRaB12Rs1SgjmOSeN_CQ@mail.gmail.com>
 <CAF6vTZZctgOOnqcseZ5-UVGQbg2baC8Le4qazOZ2rFpdH_3tcw@mail.gmail.com>
Message-ID: <20200404114134.GD22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Psychesnet, All,

On 2020-04-04 14:52 +0800, Psychesnet Hsieh spake thusly:
> Thanks and yes, I know I can use _OVERRIDE_SRCDIR to define local folder as source.
> But what I need is directly build source code at source folder without copy/rsync.

That is not possible.

Regards,
Yann E. MORIN.

> And eventually the target object will install into output/fakeroot folder.
> Do you have any idea to get it done? Thanks.
> Heiko Thiery < [1]heiko.thiery@gmail.com> ? 2020?4?3? ??
> ??5:51???
> 
>   Hi Eric,
> 
>   Am Fr., 3. Apr. 2020 um 11:07 Uhr schrieb Eric Hsieh < [2]psychesnet@gmail.com>:
>   >
>   > Hi everyone,
>   >
>   > Now, Im trying to create a special mode which can help me to build source
>   > code at source folder instead of output/build folder. I checked the makefile
>   > at package, looks like there is no directly way to be done.
>   > So, I would like to ask is it possible to be done? If yes, please give me
>   > some tips. Thanks.
> 
>   If you want to build a package from an external source folder you can
>   specify the source directory by creating the? $(CONFIG_DIR)/ [3]local.mk
>   file and set the <pkg>_OVERRIDE_SRCDIR varialbe. But this will
>   copy/rsync your sources and build your package at output/build.
> 
>   Please check "8.13.6. Using Buildroot during development" in the
>   buildroot user manual for more information about that.
> 
>   --
>   Heiko
> 
> Links:
> 1. mailto:heiko.thiery at gmail.com
> 2. mailto:psychesnet at gmail.com
> 3. http://local.mk

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
