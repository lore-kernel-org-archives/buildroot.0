From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jul 2017 09:08:58 +0200
Subject: [Buildroot] [PATCH v1] binutils-2.27: backport patch to enable
 CRC instructions on supported ARMv8-A CPUs
In-Reply-To: <20170716233123.5652e111@gmx.net>
References: <20170715231146.25019-1-ps.report@gmx.net>
 <20170716092018.546fa061@windsurf>
 <20170716233123.5652e111@gmx.net>
Message-ID: <20170717090858.26da5867@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Jul 2017 23:31:23 +0200, Peter Seiderer wrote:

> > Thanks for this patch. You're adding it to binutils 2.27, what about
> > binutils 2.26.1 ? The bug doesn't exist ?  
> 
> Bug exists with binutils 2.26.1 but the simple approach to backport (only)
> the same patch did not work:
> 
>   ./../include/opcode/arm.h:253:53: error: ?ARM_AEXT2_V8A? undeclared here (not in a function)
> 
> Seems more patches are missing...

Argh, ok. I honestly don't think it's really worth the effort trying to
fix this specific problem on the older binutils 2.26, so let's leave
things as-is, the problem will disappear by itself once we bump to
binutils 2.29, and remove binutils 2.26.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
