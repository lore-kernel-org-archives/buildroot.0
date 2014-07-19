From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:20:07 +0200
Subject: [Buildroot] Replace libev with libuv
In-Reply-To: <CALoSW67tsLPqBHrX+K+fUXWz=F2+xjLpKhYHY2pdfcoOCFEv0A@mail.gmail.com>
References: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>
 <53C91D3F.4060500@zacarias.com.ar>
 <CALoSW64Uisj3oLvPVKZ1nQXgCTEnt1yLMqV+Gy7aK4U=Q9FcUA@mail.gmail.com>
 <53C9220B.9060809@zacarias.com.ar>
 <CALoSW6550gT0qvqgo2tbaz+_VKXy0mwAQxjmsjPV66-XaUC1VA@mail.gmail.com>
 <CALoSW65dFkMpRnW0h88xAh-Tq6TAnOWz9CGExo1UWzLyMjtRLA@mail.gmail.com>
 <CALoSW67tsLPqBHrX+K+fUXWz=F2+xjLpKhYHY2pdfcoOCFEv0A@mail.gmail.com>
Message-ID: <20140719132007.GH3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nimai, All,

On 2014-07-19 08:51 -0400, Nimai Mahajan spake thusly:
> I got it. Gustavo, took a slightly different approach but this works
> (idea taken from sdl.mk, which also has a broken build process):
> 
> LIBUV_VERSION = v0.11.26
> LIBUV_SITE = $(call github,joyent,libuv,$(LIBUV_VERSION))
> LIBUV_DEPENDENCIES = host-pkgconf
> LIBUV_INSTALL_STAGING = YES
> LIBUV_AUTORECONF = YES
> LIBUV_LICENSE = BSD-2c, BSD-3c, ISC, MIT
> LIBUV_LICENSE_FILES = LICENSE
> 
> # Tweaked autogen.sh
> #define LIBUV_FIXUP_AUTOGEN
> #    echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" >$(
> <at> D) m4/libuv-extra-automake-flags.m4
> #endef

Oh, it looks like you really have a broken (utterly broken!) tree.
How did you get that  $( <at> D)  stuff? Did you by chance copy-paste
the patch from your mailer and applied it manualy?

Please, try the latest Buildroot tree, it should be OK.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
