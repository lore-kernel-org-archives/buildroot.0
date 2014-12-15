From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Mon, 15 Dec 2014 12:43:25 +0100
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <CABbD_XBC4pGrQJtNrOXajgt0kFQ62CHhVo7f4dHnTBv_Ue4c7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey, list,

On Mon, Dec 15, 2014 at 9:56 AM, Alexey Brodkin <Alexey.Brodkin@synopsys.com
> wrote:
>
> Consider following cases:
>  * Buildroot only builds rootfs that could be used on systems with
>    different default serial ports (ttyS0, ttyS1, ttyAMA3 etc)
>  * Target system has multiple serial ports and in kernel command
>    line users/developers may select different serial ports as
>    debug consoles
>
> In both cases hard-coded with BR2_TARGET_GENERIC_GETTY tty will
> only work for 1 particular serial port.
>
> This change introduces an option to use whatever existing console.
> For example console selected in kernel's command line will be used.
>

I would add another case: when BR is used to build a system without a
dedicated console, but the
SoC can be modified to provide one (like a NAS without a serial port, but
with miniUART inside).
In those cases I've seen OEMs use askfirst in inittab, as it uses less
memory then a getty always waiting.


> I'm not sure if the same thing works for SysVinit so marking it
> dependent on Busybox init.
>
I think it does, but I will test it also when I'll have time.

Anyway, I like this option. Also tested it with my build: x86_64 build and
target platform, uClibc, GCC 4.9.2, kernel 3.18 w/ integrated initrd,
VMware PXE booted, openvmtools included. Works as intended.

Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141215/f146a3d3/attachment.html>
