From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Mar 2013 09:15:16 +0100
Subject: [Buildroot] [PATCH v3 2/2] buildroot: target: Add Blackfin
 architecture support.
In-Reply-To: <51514D57.1090907@mind.be>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <1363942902-6045-2-git-send-email-sonic.adi@gmail.com>
 <51514D57.1090907@mind.be>
Message-ID: <20130326091516.36a042d2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 26 Mar 2013 08:25:11 +0100, Arnout Vandecappelle wrote:

>   Looks like you again choose a difficult patch set to try to upstream...
> 
>   After reading all the comments in this thread, I propose to split up 
> the patch set as follows in order to get some progress on it.
> 
> 1. Add blackfin CPU choice.
> This patch adds a Target CPU configuration option and uses it to select a 
> -m option for gcc.
> 
> 2. Introduce target CPU revision.
> Adds the possibility (in the general infrastructure, not 
> blackfin-specific) to have a free-form CPU revision string and append it 
> to the target CPU. Only Blackfin actually uses this option.
> 
> 3. Introduce BINFMT_FLAT.
> Just introduce the symbol and add options in blackfin to select it.

I don't think we should introduce just BINFMT_FLAT, but also
BINFMT_FDPIC (we already have a FDPIC symbol) and BINFMT_ELF, for
completeness. So I would rephrase this item into "Introduce BINFMT_*
symbols and refactor the existing usage to use BINFMT_FDPIC/BINFMT_ELF".

> 4. Introduce package-specific BINFMT_FLAT options.
> I.e. <PKG>_FLAT_STACKSIZE
> 
> 5. Introduce blackfin-specific Makefile
> Probably needs more work.
> 
> 6. Introduce NOMMU symbol
> Probably needs more work.

I fully agree with Arnout's proposal here. Let's do it step by step, so
that we discuss one issue after the other, and gets things merged
progressively.

Sonic, would you mind reworking your patch set to split it as Arnout is
suggesting?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
