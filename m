From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 12 Dec 2006 11:50:46 +0100
Subject: [Buildroot] Known working versions ?
In-Reply-To: <457E7FE3.3020605@de-brouwerij.be>
References: <457E7FE3.3020605@de-brouwerij.be>
Message-ID: <20061212105046.GA5978@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 12, 2006 at 11:09:39AM +0100, Koenraad lelong wrote:
>Hi,
>I'm very new at system-building, so excuse me if I'm asking "old" 
>questions. In that case, please redirect me to the answers.
>A few days ago I did an svn checkout, and with "make menuconfig" I made 
>a .config file. When I "make" it, I get compile-errors (in busybox, or 
>elsewhere). This morning I did an svn update, with more or less the same 
>  results.
>Since I think of svn as a system where you don't always have good 
>results, I would like to know a revision-number that is known to be 
>good. And I also would like to have a .config-file known to be good. 
>That way I could start from something that should be good, so if I have 
>problems, they have to come from my host-machine (a Suse 10.1 system 
>b.t.w.).
>Ah, I would like to make an ix86-system with a (recent) 2.16-kernel.

First off, there is no silver-bullet to versions that do what you want
:)

on x86, i usually use selected snapshots of busybox, uClibc and normally
use gcc-4_2-branch, 4.1.1 should work just fine. Binutils 2.17 and the
2.17.x.y.z.a.b.c version tend to work for me. I normally select generic
x86 device to build a kernel to play with. The 2.6.19 kernel (also used
for the kernel-headers) works satisfactorily well for me, as do the
headers.

I strip that silly -Werror off busybox' Makefile.flags, of course, as i
have gcc patches that make compilation a bit verbose and would prevent
alot of code to build with -Werror, fwiw.

>I hope I'm not unreasonable when I ask these, thank you for _any_ help.

np.
