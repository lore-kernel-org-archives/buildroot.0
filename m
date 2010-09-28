From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Sep 2010 15:48:35 +0200
Subject: [Buildroot] [PATCH] add lzop dependency
In-Reply-To: <4CA1EE76.9090605@visionsystems.de> (Yegor Yefremov's message of
	"Tue, 28 Sep 2010 15:32:38 +0200")
References: <4CA0542C.4080400@visionsystems.de>
	<87aan211an.fsf@macbook.be.48ers.dk>
	<4CA1EE76.9090605@visionsystems.de>
Message-ID: <8762xq0yj0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 >> Lzop isn't that common and it's only needed for a fairly specific setup,
 >> wouldn't it make more sense to build it if needed using the host
 >> infrastructure we have instead?

 Yegor> Yes, it makes sense. I'll rewrite the patch. What do you think
 Yegor> about letting user to specify kernel compression:

That makes sense on ARM when zImage is selected, but might not for other
archs. From a quick look in the kernel sources it seems to be available
on:

arm, blackfin, mips, s390, sh, x86

So atleast ppc, avr32 and sparc are missing.

-- 
Bye, Peter Korsgaard
