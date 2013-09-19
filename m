From: Jason Rennie <jason.rennie@rftechnology.com.au>
Date: Thu, 19 Sep 2013 10:25:50 +1000
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130918220953.GA3557@free.fr>
References: <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639ACE1F5@ex-mb1.corp.adtran.com>
 <20130916200135.1724084e@skate> <523906E4.8080404@rftechnology.com.au>
 <20130918220953.GA3557@free.fr>
Message-ID: <523A448E.6010402@rftechnology.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/2013 8:09 AM, Yann E. MORIN wrote:
>
> Yes, that's basically true.
>
> But consider this:
>    - you use Buildroot to build a GPL package, which ends up on the
>      target
>
>    - that package is GPL, so the GPL applies to that package
>
>    - section 3 of the GPL requires you provide the "scripts used to
>      control compilation and installation of the executable."
>
>    - So you have two options:
>      - come up with the instructions by yourself (by looking at how
>        Buildroot does its stuff, for example), but it's not trivial;
>      - or provide your Buildroot tree (and .config) since this is the
>        easiest. Let's assume that's the way you go.
>
>    - so, since you are distributing Buildroot, you have to abide by its
>      license. It happens that this license is the GPL, but it's just
>      happenstance that it is the same license as your GPL package, above.
>

Wouldn't the intent of the license suggest that this was talking about 
the makefiles/configure scripts/whatever that you need to actually build 
the executable? Rather than some metabuild script like buildroot? I'm 
guessing the clause is there to stop someone "complying" by giving you a 
bunch of .c and .h files but not providing you a meaningful way to get 
an executeable out the other end.

The understanding you are suggesting would seem to be like requiring 
that the automated build script that runs on a build server of an 
evening (which calls the make files, maybe runs some automated tests 
etc, basically an automated developer task) would need to be included to 
distribute the software.

As I said IANAL and so perhaps that would be required but that would 
seem like a bug in the license at that point and the problem is the 
terms of the license needing review.

Jason
