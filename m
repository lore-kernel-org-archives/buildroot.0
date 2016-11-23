From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 13:06:36 +0100
Subject: [Buildroot] Bare metal toolchain support?
In-Reply-To: <CAM+bi4vNKMBr0Dv9_-rsQzU_kPNrze7o9_EcSEA--g2UCVCfzg@mail.gmail.com>
References: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
 <20161123113517.04f6ec47@free-electrons.com>
 <CAM+bi4vNKMBr0Dv9_-rsQzU_kPNrze7o9_EcSEA--g2UCVCfzg@mail.gmail.com>
Message-ID: <20161123130636.5b362a27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 12:20:35 +0100, Alvaro Gamez wrote:

> errno.c:6:19: fatal error: reent.h: No such file or directory
>  #include <reent.h>
> 
> This reent.h header doesn't exist in the toolchain built by buildroot, but
> it exists on Xilinx's:

reent.h is a newlib-specific header, which indeed will only exist on
bare-metal toolchains that use newlib. However, it's surprising that
bootloader code includes reent.h: this file defines the reentrant
variant of a number of system-level functions (close, stat, etc.). Which
doesn't make a lot of sense in a bootloader.

Perhaps it is not really used? I guess, you'll have to hack things
a bit to get them to build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
