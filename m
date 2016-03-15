From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2016 14:37:49 +0100
Subject: [Buildroot] [PATCH 2/2] valgrind: disable for MIPS soft-float
 when using binutils >= 2.25
In-Reply-To: <1458041310-65003-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1458041310-65003-1-git-send-email-Vincent.Riera@imgtec.com>
 <1458041310-65003-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160315143749.0b6d5fb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 15 Mar 2016 11:28:30 +0000, Vicente Olivert Riera wrote:
> As stated here [1], recent changes on the MIPS binutils sources have
> made it necessary for GCC to pass the -msoft-float to the assembler. Due
> to that, valgrind fails to build for MIPS soft-float when using a
> version of GCC >= 4.9 and binutils >= 2.25 because its using some
> hard-float instructions.

So I think we should just add "depends on !BR2_MIPS_SOFT_FLOAT.

If your use case is broken with the more recent versions of the tools,
and will continue to be broken for the newer versions of them, we
should IMO just disable completely the support on MIPS soft-float.

Of course, that's my own opinion, others might disagree.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
