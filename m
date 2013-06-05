From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Jun 2013 19:17:19 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-06-04
In-Reply-To: <51AF6FD2.1090803@zacarias.com.ar>
References: <20130605063004.4425352C13E@lolut.humanoidz.org>
 <20130605182924.71a07679@skate> <20130605170058.GA3185@free.fr>
 <51AF6FD2.1090803@zacarias.com.ar>
Message-ID: <20130605171719.GB3185@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2013-06-05 14:05 -0300, Gustavo Zacarias spake thusly:
> On 06/05/2013 02:00 PM, Yann E. MORIN wrote:
> 
> >> PowerPC does not have a.out.h. But mipsel also doesn't
> >> (http://autobuild.buildroot.org/results/019/019091312ec547520370ffad967b53e23f54a14b/build-end.log),
> >> libbsd doesn't have support for AArch64
> >> (http://autobuild.buildroot.org/results/87c/87c3a8bf2248606d80ddcfd96132de4c5fe869ed/build-end.log).
> >> And SH4 doesn't have a.out.h
> >> (http://autobuild.buildroot.org/results/589/5891f539ce3f3ff2e3411228472c8833fdd0d7c0/build-end.log).
> > 
> > Mine! ;-)
> 
> Already tried guarding the a.out.h include with __NO_A_OUT_SUPPORT in
> src/nlist.c, but that's not enough, it's using the N_EXT and other
> defines from a.out.h
> (to avoid going a path that's been walked before!)

Best for Buildroot is just to depends on !(ARCH_it_s_broken_on).

As said on IRC, if an arch is missing something, we don't add it.
(If it's broken, we can fix it, however).

And faking a a.out.h does not seem so trivial ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
