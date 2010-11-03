From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 03 Nov 2010 16:23:08 -0300
Subject: [Buildroot] [Review] Add gcc 4.5.1
In-Reply-To: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
References: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <4CD1B69C.8020402@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/20/10 19:03, Martin Banky wrote:

> This is the first pass at adding gcc 4.5.1 to buildroot. It builds fine for the
> host and the target. The question I have, is the implementation the correct
> way to change the toolchain? I couldn't find a lot of documentation regarding
> the toolchain (as far as changing or updating it). Also, can the toolchain mk
> files be updated to the new format or are their builds too complex?
> 
> [PATCH 1/3] dbus: bump to 1.4.0
> [PATCH 2/3] m4: bump to 1.4.15
> [PATCH 3/3] Added gcc 4.5.1 to buildroot

Hi.
I've been testing this and stuck in a few fixes.
My changes are at git://repo.or.cz/buildroot-gz.git
Fixes are various:
* Fix mpc download site
* Forward-port the powerpc softfloat patch (you probably didn't hit the
problem because it's conditional)
* Disable targetopts for powerpc and gcc 4.5.x
* Fix a ton of ARM issues

Word of caution, gcc 4.5 isn't able to build good ARM kernels that can
load modules for versions <2.6.36 unless a patch is applied, see
https://bugzilla.kernel.org/show_bug.cgi?id=16310
Tested for arm softfloat (hardware), arm hardfloat (qemu), mips32
(qemu), powerpc hardfloat (e300c3) and powerpc softfloat (qemu).
Thanks for your work on this.
Regards.
