From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 21 Apr 2014 10:18:53 +0000
Subject: [Buildroot] Analysis of build results for 2014-04-20
In-Reply-To: <20140421114949.59c65c31@skate>
References: <20140421063009.036D5100FF4@stock.ovh.net>
 <20140421114949.59c65c31@skate>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356CB9EA2@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> 
> >        arc |                openswan-2.6.41 | NOK |
> http://autobuild.buildroot.net/results/71f92d80b1aa3ac98660fb88004efd0ea
> 55e784e/
> 
> /home/test/test/3/output/host/usr/lib/gcc/arc-buildroot-linux-
> uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
> /home/test/test/3/output/host/usr/arc-buildroot-linux-
> uclibc/sysroot/usr/lib/crt1.o: relocation R_ARC_32_ME against `main' can not
> be used when making a shared object; recompile with -fPIC
> /home/test/test/3/output/host/usr/arc-buildroot-linux-
> uclibc/sysroot/usr/lib/crt1.o: could not read symbols: Bad value
> collect2: error: ld returned 1 exit status
> make[4]: *** [pluto] Error 1
> 
> Could some ARC person look into this? Alexey, Anton?

[AK:] This is a limitation of ARC uClibc port: our crt1.o doesn't support PIE (though it seems simple hello world can be compiled). Our uClibc developer (added to CC) is going to fix this in near future, but he has a lot of other tasks to do right now, so this might not happen immediately.

Anton 
