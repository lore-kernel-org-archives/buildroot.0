From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Oct 2015 19:20:43 +0100
Subject: [Buildroot] Help Adding Package to build root..
In-Reply-To: <CACvocV4-o7u1L52xP7YnVTgoi369NUDk6vP4=ng6cLuwzXOvVw@mail.gmail.com>
References: <CACvocV4-o7u1L52xP7YnVTgoi369NUDk6vP4=ng6cLuwzXOvVw@mail.gmail.com>
Message-ID: <20151027182043.GF3555@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giovanni, All,

On 2015-10-27 18:52 +0100, astrolite . spake thusly:
> Hi all sorry for my stupid question but i've a problem to adding a packages
> to buid root..
> 
> I need to add a package called pigpio.
> I've create a .tar.gz on github with all the file required.
> The link is : https://github.com/ciclonite/pigpio
> 
> 
> Here what happens:
> gzip -d -c
> /root/qt-dev/buildroot-qt-dev/buildroot-2015.05/dl/libpigpio-38.tar.gz |
> tar --strip-components=1 -C
> /root/qt-dev/buildroot-qt-dev/buildroot-2015.05/output/build/libpigpio-38
>  -xf -
> >>> libpigpio 38 Patching
> >>> libpigpio 38 Updating config.sub and config.guess
> for file in config.guess config.sub; do for i in $(find
> /root/qt-dev/buildroot-qt-dev/buildroot-2015.05/output/build/libpigpio-38
> -name $file); do cp support/gnuconfig/$file $i; done; done
> >>> libpigpio 38 Configuring
> >>> libpigpio 38 Autoreconfiguring
> autoreconf: 'configure.ac' or 'configure.in' is required
> Why the autoreconf cannot find configure.ac? in the tar.gz it's present!

I've made a very simple and minimalistic pgipio package:

    $ cat package/pigpio/pigpio.mk
    PIGPIO_VERSION = 924b8d2baf2d36336bf9ba320a22f3306783c051
    PIGPIO_SITE = $(call github,ciclonite,pigpio,$(PIGPIO_VERSION))
    PIGPIO_AUTORECONF = YES
    $(eval $(autotools-package))

And it does autoreconf nicely for me.

Care to share your own .mk so we can compare and identify your issue?

It does not build, because there is a missing custom.cext file, but your
direct problem does not happen for me.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
