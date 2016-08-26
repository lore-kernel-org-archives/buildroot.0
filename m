From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 15:37:07 +0200
Subject: [Buildroot] [PATCH] gcc: ARC Fix conditional move contstraint.
In-Reply-To: <1472203712-27459-1-git-send-email-vzakhar@synopsys.com>
References: <1472203712-27459-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160826153707.1a1d2858@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Typo in the commit title: contstraint -> constraint

On Fri, 26 Aug 2016 12:28:32 +0300, Vlad Zakharov wrote:
> The patch solves one of the ARC internal compiler issues.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1c4/1c4493c6a18b7a93a0368420c8f79032f9330891//
> http://autobuild.buildroot.net/results/510/51071b790866b0c7083de3a94ad2a427009096af//
> http://autobuild.buildroot.net/results/09e/09e037c628ca2a27d8eb832dd070f50ec7ebb72a//

Trailing slash not really needed, and we also need an empty line
between the commit log contents and the SoB line.

> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

I've fixed up those issues and applied to master!

> +diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
> +index d87174a..607c6e6 100644
> +--- a/gcc/config/arc/arc.md
> ++++ b/gcc/config/arc/arc.md
> +@@ -3603,7 +3603,7 @@
> +      (match_operator 3 "proper_comparison_operator"
> +        [(match_operand 2 "cc_register" "Rcc,Rcc") (const_int 0)])
> +      (set (match_operand:SI 0 "dest_reg_operand" "=w,w")
> +-	  (match_operand:SI 1 "nonmemory_operand" "Lc,?Cal")))]
> ++	  (match_operand:SI 1 "nonmemory_operand" "LRac,?Cal")))]

I have to say the gcc .md files are pretty arcane stuff, especially
when you see such patches :-)

Thanks for fixing this issue. I'll rebuild the ARC toolchain right
away, and deploy it on the autobuilders.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
