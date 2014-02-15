From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 15 Feb 2014 13:07:33 +0100
Subject: [Buildroot] [PATCH v5 5/5] xbmc: new package
In-Reply-To: <20140215115139.GB5291@free.fr>
References: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392332394-27935-6-git-send-email-maxime.hadjinlian@gmail.com>
 <20140215115139.GB5291@free.fr>
Message-ID: <CAGduivwYSjBKSAGY72vTGKhq1zXPKoAZ2=x9kny61H0Vmm8EnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all
On Sat, Feb 15, 2014 at 12:51 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Maxime, All,
>
> On 2014-02-13 23:59 +0100, Maxime Hadjinlian spake thusly:
>> XBMC is an award-winning free and open source (GPL) software media player and
>> entertainment hub for digital media.
>
> Just a quick comment before I forget...
> Hopefully I'll have some more time for a proper review later today...
>
> [--SNIP--]
>> +config BR2_PACKAGE_XBMC_LIBCEC_RBP
>> +     bool "rpi support"
>> +     depends on BR2_INSTALL_LIBSTDCPP
>> +     depends on BR2_LARGEFILE
>> +     select BR2_PACKAGE_RPI_USERLAND
>> +     select BR2_PACKAGE_LIBCEC_RBP
>
> git grep BR2_PACKAGE_LIBCEC_RBP
> --> nothing... ?
Ouch ! Forgot to modify this... When I added libcec initially, there
was a specific choice for the RBP which was removed and then if
rpi-userland was selected, take advantage of it.
>
>> +     help
>> +       Enable RasberryPi support
>> +
>> +comment "rpi support requires a toolchain with C++ and LARGEFILE support"
>> +     depends on !(BR2_INSTALL_LIBSTDCPP && BR2_LARGEFILE)
>> +
>> +endif
>
> If rpi-userland is selected, then just assume RPi support is wanted.
> This should get rid of the circular dependency on EGL/GLES you mentioned
> later.
Make sense, I will look into it.
>
> Regards,
> Yann E. MORIN.
Thanks
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
