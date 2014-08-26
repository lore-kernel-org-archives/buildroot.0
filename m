From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Aug 2014 10:23:38 +0200
Subject: [Buildroot] Building RPi toolchain with 2014.05
In-Reply-To: <lthbud$oba$1@ger.gmane.org>
References: <lthbud$oba$1@ger.gmane.org>
Message-ID: <20140826082338.GA3925@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Malte, Al,

On 2014-08-26 09:11 +0200, Malte Forkel spake thusly:
> with buildroot 2013.05, I could create a toolchain for Raspberry Pi with
>     $ make rpi_defconfig
>     $ make toolchain
> If I try the same with buildroot 2014.05, i.e.
>     $ make raspberrypi_defconfig
>     $ make toolchain
> the log ends with
>     >>> toolchain-buildroot undefined Extracting
>     >>> toolchain-buildroot undefined Patching
>     >>> toolchain-buildroot undefined Configuring
>     >>> toolchain-buildroot undefined Building
>     >>> toolchain-buildroot undefined Installing to target
>     >>> toolchain undefined Extracting
>     >>> toolchain undefined Patching
>     >>> toolchain undefined Configuring
>     >>> toolchain undefined Building
>     >>> toolchain undefined Installing to target
> and the directory output/toolchain is not created.
> 
> What am I missing?

I just tested the master branch, and it does build the toolchain
sucessfully.

But the toolchain does not end up in output/toolchain/. It is located in
output/host/  and can be called with, for example:
    /path/to/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
