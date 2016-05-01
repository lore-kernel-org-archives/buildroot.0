From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 15:07:21 +0200
Subject: [Buildroot] [PATCH] libgee: disable for external CS PowerPC
 toolchain
In-Reply-To: <1462086845-3820-1-git-send-email-joerg.krause@embedded.rocks>
References: <1462086845-3820-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160501150721.4a6111ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 09:14:05 +0200, J?rg Krause wrote:
> The external CodeSourcery PowerPC toolchain is unable to build libgee
> successfully resuling in an internal compiler error:
> 
> hazardpointer.c: In function 'gee_hazard_pointer_release_policy_ensure_start':
> hazardpointer.c:845:1: error: insn does not satisfy its constraints:
> (insn 151 150 152 8 hazardpointer.c:838 (set (reg:SI 11 11)
>         (plus:SI (reg:SI 0 0 [orig:128 D.16455 ] [128])
>             (const_int -2147483648 [0xffffffff80000000]))) 82 {*addsi3_internal1} (nil))
> hazardpointer.c:845:1: internal compiler error: in copyprop_hardreg_forward_1, at regcprop.c:768

Thanks for the patch, but Gustavo had already submitted a patch that
completely removes the Sourcery PowerPC toolchains from Buildroot, as
they are too old and causing too many problems.

I've marked your patch as "Rejected" in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
