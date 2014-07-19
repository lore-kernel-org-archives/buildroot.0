From: Nimai Mahajan <nimaim@gmail.com>
Date: Sat, 19 Jul 2014 09:40:59 -0400
Subject: [Buildroot] Replace libev with libuv
In-Reply-To: <20140719132007.GH3593@free.fr>
References: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>
 <53C91D3F.4060500@zacarias.com.ar>
 <CALoSW64Uisj3oLvPVKZ1nQXgCTEnt1yLMqV+Gy7aK4U=Q9FcUA@mail.gmail.com>
 <53C9220B.9060809@zacarias.com.ar>
 <CALoSW6550gT0qvqgo2tbaz+_VKXy0mwAQxjmsjPV66-XaUC1VA@mail.gmail.com>
 <CALoSW65dFkMpRnW0h88xAh-Tq6TAnOWz9CGExo1UWzLyMjtRLA@mail.gmail.com>
 <CALoSW67tsLPqBHrX+K+fUXWz=F2+xjLpKhYHY2pdfcoOCFEv0A@mail.gmail.com>
 <20140719132007.GH3593@free.fr>
Message-ID: <CALoSW642aRZZ9koGitrGTxZ0hjpJO_9nOa5fopgkPnCrnBwM6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ahh yes so I did ... sorry, stupid mistake. I will use the latest
tree. cgit web should show all the latest commits since that just
reflects the git repo correct? I will use that. I thought the <at> was
some special BR syntax I'd never seen before. Thanks Yann. Hopefully I
will be able to contribute some new packages in the future after
learning the syntax about all the different make types.

Slightly off topic question but what would be your recommendation
about taking an existing package compiled for and written for a
regular Linux host (i.e. Mint) and integrating it into Buildroot?
Convert the traditional Makefile into CMake? Autotools? We have a lot
of code with traditional Makefiles that need to be integrated into an
embedded Buildroot environment. Thanks.

On Sat, Jul 19, 2014 at 9:20 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Nimai, All,
>
> On 2014-07-19 08:51 -0400, Nimai Mahajan spake thusly:
>> I got it. Gustavo, took a slightly different approach but this works
>> (idea taken from sdl.mk, which also has a broken build process):
>>
>> LIBUV_VERSION = v0.11.26
>> LIBUV_SITE = $(call github,joyent,libuv,$(LIBUV_VERSION))
>> LIBUV_DEPENDENCIES = host-pkgconf
>> LIBUV_INSTALL_STAGING = YES
>> LIBUV_AUTORECONF = YES
>> LIBUV_LICENSE = BSD-2c, BSD-3c, ISC, MIT
>> LIBUV_LICENSE_FILES = LICENSE
>>
>> # Tweaked autogen.sh
>> #define LIBUV_FIXUP_AUTOGEN
>> #    echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" >$(
>> <at> D) m4/libuv-extra-automake-flags.m4
>> #endef
>
> Oh, it looks like you really have a broken (utterly broken!) tree.
> How did you get that  $( <at> D)  stuff? Did you by chance copy-paste
> the patch from your mailer and applied it manualy?
>
> Please, try the latest Buildroot tree, it should be OK.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
