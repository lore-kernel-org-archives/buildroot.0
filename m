From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Nov 2013 12:07:34 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <527F6683.4000103@zacarias.com.ar>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate> <527F6683.4000103@zacarias.com.ar>
Message-ID: <20131110120734.00d97a16@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 10 Nov 2013 07:57:07 -0300, Gustavo Zacarias wrote:

> >>     mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/cb87635832f4a1128f174a25c264f716399c52d4/
> > 
> > MIPS specific problem. We're building for mips1, but fdk-aac uses some
> > instructions not available on mips1. Maybe we should only enable
> > fdk-aac for some more capable variant of MIPS instruction sets.
> > 
> > Markos, can you have a look at this one?
> 
> Why not just ditch MIPS1 & MIPS2 ISAs like we did with generic ARM?
> AFAIK (and Markos feel free to chime in) those aren't used in anything
> modern these days, just in very very old SGI machines that didn't run
> linux as far as i know.
> Even MIPS3's usefulness is doubtful.

I don't have a very good vision of the MIPS space, but if Markos
agrees, I'm definitely fine with not supporting old MIPS processors
that are never used with Linux.

> I've looked into the source and the asm optimizations are so messy that
> it hurts to look at, and don't seem to be easily disabled.

Well, my idea was certainly not to fix fdk-aac itself, but simply add a
bunch of 'depends on !BR2_mips<something>' to avoid the problematic
platforms.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
