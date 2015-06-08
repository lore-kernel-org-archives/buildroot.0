From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Jun 2015 23:44:43 +0200
Subject: [Buildroot] [PATCH 01/11] package-infra: add helper to build
 kernel modules
In-Reply-To: <55760493.1070807@mind.be>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>
 <55760493.1070807@mind.be>
Message-ID: <20150608214443.GH3590@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-08 23:09 +0200, Arnout Vandecappelle spake thusly:
> On 06/07/15 00:20, Yann E. MORIN wrote:
[--SNIP--]
> > +# Duplicate that from pkg-generic because we need it now
> > +ifndef $(2)_MAKE
> > +  $(2)_MAKE = $(MAKE)
> > +endif
> 
>  I don't see why this is needed... The defines below will only be expanded when
> the rule is executed (otherwise $(PKG) would not even be defined), so the
> definition from pkg-generic is enough, no?

Well, I tried to remove it, and it does not work (indetation added by me):

>>> cryptodev-linux 1.7 Building kernel module(s)
C /home/ymorin/dev/buildroot/O/build/linux-4.0.4 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=i386
    INSTALL_MOD_PATH=/home/ymorin/dev/buildroot/O/target CROSS_COMPILE="/home/ymorin/dev/buildroot/O/host/usr/bin/i686-pc-linux-gnu-"
    DEPMOD=/home/ymorin/dev/buildroot/O/host/sbin/depmod KERNEL_DIR=/home/ymorin/dev/buildroot/O/build/linux-4.0.4
    PREFIX=/home/ymorin/dev/buildroot/O/target M=/home/ymorin/dev/buildroot/O/build/cryptodev-linux-1.7/. modules
/bin/sh: C: command not found
make[1]:
[/home/ymorin/dev/buildroot/O/build/cryptodev-linux-1.7/.stamp_built]
Error 127 (ignored)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
