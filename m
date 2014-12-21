From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:09:13 +0100
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141221220913.5cb62321@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 15 Dec 2014 11:56:24 +0300, Alexey Brodkin wrote:
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
> I'm not sure if the same thing works for SysVinit so marking it
> dependent on Busybox init.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In the light of the discussion that has taken place, we have found a
solution that apparently matches your use case, by using the existing
Buildroot options. Therefore, I've marked your patch as Rejected in
patchwork. If you disagree, do not hesitate to re-send an updated
version with an extended justification.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
