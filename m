From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 14:08:38 +0200
Subject: [Buildroot] [PATCH] ci20_defconfig: disable madd instructions
 to avoid FPU bug
In-Reply-To: <d058213e-21f3-59e3-49ae-103d4fce6a8c@mind.be>
References: <20161018122421.64118-1-Vincent.Riera@imgtec.com>
 <20161018145413.37ae0751@free-electrons.com>
 <68e76d80-a505-e029-941a-fe43d9780536@imgtec.com>
 <20161019113229.02a9d8c3@free-electrons.com>
 <d058213e-21f3-59e3-49ae-103d4fce6a8c@mind.be>
Message-ID: <20161022140838.165b2fc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Oct 2016 21:45:52 +0200, Arnout Vandecappelle wrote:

> > Ideally, we should mimic what we do on ARM, and only list in
> > "Target architecture variants" the cores and not the ISA. How many
> > vendors are doing MIPS cores, and how many cores are they doing?  
> 
>  I believe that for MIPS, every vendor uses their own core, and that there is an
> almost one-to-one mapping between SoC family and core. AFAIU it's only the
> instruction set that is standardized. My gcc supports 74 cores... Do we really
> want to add all of these?

Well, did you count for ARM? There are also many many cores supported
in gcc. Admittedly probably not 74 cores, indeed.

>  That said, now we already have a bit a mixed situation: we have a few
> processors and a few generic options in Config.in.mips. But I expect that
> Buildroot will often be used on SoCs where either Buildroot or GCC doesn't have
> a processor-specific option yet, so the generic ones will still be needed.

OK, fair enough. Then maybe they should be clearly separated by a
comment within the choice...endchoice block.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
