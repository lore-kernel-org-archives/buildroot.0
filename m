From: Ben Dooks <ben@fluff.org>
Date: Fri, 29 Jun 2007 14:53:55 +0100
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <46844AEC.7020007@gmail.com>
References: <20070628103443.GT31791@trinity.fluff.org>
	<019801c7b9d6$ba07ed10$ebba820a@atmel.com>
	<46844AEC.7020007@gmail.com>
Message-ID: <20070629135355.GE3856@trinity.fluff.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 28, 2007 at 04:57:32PM -0700, Tom wrote:
> Ulf Samuelsson wrote:
> >>The problem with buildroot is that it gives you a choice of ARM cpus.
> >>If you select ARM920T, then you have an expectation of being able
> >>to run the binaries produced on an ARM920T, which currently if EABI
> >>is also selected is impossible.
> >>
> >
> >So should we not just make EABI depend on !ARM920T
> >

1) EABI will work fine on ARM920T (and other ARMv4) targets 
2) Currently, until other patches, a number of the available gcc choices
   do not currently build a compiler, let alone make it to the application
   stage.
3) The proposed fix in 1406 attempts to ensure that down the road we don't
   fall into this trap again.
 
> I would say no, because this combination works for buildroot. (However, 
> if you _only_ select ARM920T and EABI and don't take care of the CPU 
> options, it will fail.)

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
