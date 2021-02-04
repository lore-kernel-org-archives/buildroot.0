From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Feb 2021 10:20:46 +0100
Subject: [Buildroot] [PATCH 17/25] support/config-fragments/autobuild:
 use Bootlin toolchain for RISC-V 64 glibc
In-Reply-To: <20210203212419.GH2384@scaer>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
 <20210202225339.2157480-18-thomas.petazzoni@bootlin.com>
 <20210203212419.GH2384@scaer>
Message-ID: <20210204102046.6a8a4833@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Feb 2021 22:24:19 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > diff --git a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
> > new file mode 100644
> > index 0000000000..f6c6fcaa36
> > --- /dev/null
> > +++ b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
> > @@ -0,0 +1,5 @@
> > +BR2_riscv=y
> > +BR2_RISCV_ABI_LP64=y  
> 
> The previous fragment would not specify the ABI, so that would use the
> default, lp64d.
> 
> So, why are you switching over to the lp64 ABI?

Because the Bootlin toolchain is for the LP64 ABI, and not the LP64D
ABI, and I thought it was OK to change this autobuilder testing from
LP64D to LP64.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
