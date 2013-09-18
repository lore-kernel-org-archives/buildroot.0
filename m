From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Sep 2013 00:09:53 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <523906E4.8080404@rftechnology.com.au>
References: <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639ACE1F5@ex-mb1.corp.adtran.com>
 <20130916200135.1724084e@skate>
 <523906E4.8080404@rftechnology.com.au>
Message-ID: <20130918220953.GA3557@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jason, All,

On 2013-09-18 11:50 +1000, Jason Rennie spake thusly:
> I may be missing something here and feel free to call me names if I am, also
> IANAL.
> 
> That being said, wouldn't building a system with buildroot be essentially
> the same case to using GCC to compile a program? The final libraries you
> link with (or packages you include in the case of buildroot) may be
> encumbered with all manner of licenses but the license of the buildtool
> doesn't make any difference to the license status of the final product.

Yes, that's basically true.

But consider this:

  - you use Buildroot to build a GPL package, which ends up on the
    target

  - that package is GPL, so the GPL applies to that package

  - section 3 of the GPL requires you provide the "scripts used to
    control compilation and installation of the executable."

  - So you have two options:
    - come up with the instructions by yourself (by looking at how
      Buildroot does its stuff, for example), but it's not trivial;
    - or provide your Buildroot tree (and .config) since this is the
      easiest. Let's assume that's the way you go.

  - so, since you are distributing Buildroot, you have to abide by its
    license. It happens that this license is the GPL, but it's just
    happenstance that it is the same license as your GPL package, above.

> If you were making changes to buildroot and redistributing those then the
> license would apply but not otherwise.

I believe we never argued otherwise. :-)

What was said was, to comply with the section 3 of the GPLv2 for programs
on the target, the easiest is to provide the Buildroot tree (and .config).

Note that doing so is not enough: you'd still have to provide the sources
of the (L)GPL programs that end up on the target.

Again, IANAL... ;-)

Note: I'm talking about section 3 of the GPLv2. GPLv3 has a similar
section, but I'm not digging it now; I'll let you look at it by
yourself! ;-p

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
