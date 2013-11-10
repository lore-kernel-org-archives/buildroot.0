From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 10 Nov 2013 07:57:07 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131109191543.414f5694@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
Message-ID: <527F6683.4000103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/2013 03:15 PM, Thomas Petazzoni wrote:

>>     mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/cb87635832f4a1128f174a25c264f716399c52d4/
> 
> MIPS specific problem. We're building for mips1, but fdk-aac uses some
> instructions not available on mips1. Maybe we should only enable
> fdk-aac for some more capable variant of MIPS instruction sets.
> 
> Markos, can you have a look at this one?

Why not just ditch MIPS1 & MIPS2 ISAs like we did with generic ARM?
AFAIK (and Markos feel free to chime in) those aren't used in anything
modern these days, just in very very old SGI machines that didn't run
linux as far as i know.
Even MIPS3's usefulness is doubtful.
I've looked into the source and the asm optimizations are so messy that
it hurts to look at, and don't seem to be easily disabled.
Regards.
