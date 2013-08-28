From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Aug 2013 23:29:22 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20130828090812.43a7f849@skate>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
Message-ID: <521E6BB2.4070907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/13 09:08, Thomas Petazzoni wrote:
>>        i686 |                       bash-4.2 | NOK |http://autobuild.buildroot.net/results/b85caa22ddc13bdaaac25b9016fe902ade5027de/
> ./mksyntax -o syntax.c
> make[1]: execvp: ./mksyntax: Permission denied
> ./mksignames lsignames.h
>
> Strange. Missing executable permissions on this program? Why does it
> happen only rarely?

  Parallel build problem. mksyntax is built twice, and is sometimes 
executed while it is being rebuilt. I can't immediately see the problem 
in the Makefile.in, though.

  Non-parallel build takes about the twice the time of the configure 
step, so I guess that's the easiest way out.

  Patch follows.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
