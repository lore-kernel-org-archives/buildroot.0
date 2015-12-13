From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:18:57 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: bump 0.10.x branch to
 version 0.10.41
In-Reply-To: <566DD825.3000105@mind.be>
References: <1449609500-10071-1-git-send-email-joerg.krause@embedded.rocks>
 <20151212183235.09bb8139@free-electrons.com>
 <566DD825.3000105@mind.be>
Message-ID: <20151213221857.602779ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, 13 Dec 2015 21:42:13 +0100, Arnout Vandecappelle wrote:

>  I guess, when BR2_ARM_FPU_VFPV3 of _D16 is selected, we should also select
> BR2_ARM_CPU_HAS_VFPV3. Which is of course not possible because then we get a
> circular dependency. So more hidden intermediate symbols...

Yes, the FPU selection is not yet good. If you have selected a VFPv3,
then of course your VFP is compatible with VFPv2, so the corresponding
symbols should be selected.

We need to rethink a bit these VFP Config.in options to make this work
properly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
