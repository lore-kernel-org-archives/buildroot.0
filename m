From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 17 Apr 2011 17:40:17 +0200
Subject: [Buildroot] Problems using buildroot with crosstoll-ng
In-Reply-To: <BANLkTik6g3rhC1_WfRLkBodNVsOUhjKaJA@mail.gmail.com>
References: <BANLkTik6g3rhC1_WfRLkBodNVsOUhjKaJA@mail.gmail.com>
Message-ID: <201104171740.17634.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ettore, All,

On Friday 15 April 2011 22:14:06 Ettore Campion wrote:
> I'm trying to use buildroot with crosstool-ng to create a glibc based
> cross-toolchain and root filesystem image for a mipsel target.
> I'm using the default settings everywhere besides the kernel-headers:
> I'm using here a custom linux tarball based on linux 2.6.22.
> The toolchain seems to be correctly generated but there are some
> problems in the copy of the generated libraries files to the target
> directory.
> 
> The fist problem I faced was the following:
> CTNG_TUPLE='mipsel-unknown-linux-gnu'
> CTNG_SYSROOT='/home/tora/Projects/buildroot-2011.02/output/host/
> usr/mipsel-unknown-linux-gnu/sys-root' 
                               ^^^^^^^^
Bummer... There's an issue here.
It should be 'sysroot', not 'sys-root'. I'm testing a fix here.

> In crosstool-ng menuconfig I specified the sysroot dir like default as
> "sysroot", not "sys-root".

Which should be hidden in this case. I'm testing a fix here.

> Taking again a look to crosstool-ng.mk and target/lib I noticed that
> was missing ld.so.1, manually adding the lib to target/lib I got rid
> of the missing init message

OK, I'll see if it has anything to do with the above issue.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
