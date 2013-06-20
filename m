From: piquemal michel <michel_piquemal@yahoo.fr>
Date: Thu, 20 Jun 2013 22:17:52 +0100 (BST)
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <87txkvr0sj.fsf@dell.be.48ers.dk>
References: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87bo77yveg.fsf@dell.be.48ers.dk>
 <1371329906.70128.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87sj0jxf0n.fsf@dell.be.48ers.dk>
 <1371332003.62321.YahooMailNeo@web171505.mail.ir2.yahoo.com>
 <877ghvxdkf.fsf@dell.be.48ers.dk>
 <1371338781.70346.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87r4g1vo98.fsf@dell.be.48ers.dk>
 <1371414331.31683.YahooMailNeo@web171504.mail.ir2.yahoo.com>
 <87li69tdqv.fsf@dell.be.48ers.dk>
 <1371560776.84702.YahooMailNeo@web171502.mail.ir2.yahoo.com>
 <87txkvr0sj.fsf@dell.be.48ers.dk>
Message-ID: <1371763072.16710.YahooMailNeo@web171501.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter

Just a quick note to let know (in case anyone finds it usefull at some point) one can build a reasonably approaching toochain, namely with:
- Buildroot 2010.05
- uclibc 0.9.28.3
- Linux 2.6.33.5 headers
- gcc 4.1.2
- binutils 2.17
- patches from http://lists.busybox.net/pipermail/uclibc-cvs/2006-September/023471.html
- patch from https://bugs.busybox.net/show_bug.cgi?id=4171 to build root fs (but I only need toolchain)


I still could not be successful with gcc 3.4.x (probably requires binutils 2.15). Later gcc 4.3 would also fail (asset issue).

Of course I did not try all gcc combos, but that one seems decently ok.

I'm still interested if anyone has a trick to fully match linux 2.6.36, uClibc 0.9.28, gcc 3.4.2

Thanks again for your kind support.





----- Mail original -----
De?: Peter Korsgaard <jacmet@uclibc.org>
??: piquemal michel <michel_piquemal@yahoo.fr>
Cc?: Peter Korsgaard <jacmet@uclibc.org>; "buildroot at busybox.net" <buildroot@busybox.net>
Envoy? le : Mardi 18 juin 2013 15h44
Objet?: Re: Building with uClibc 0.9.28, Linux 2.6.36

>>>>> "piquemal" == piquemal michel <michel_piquemal@yahoo.fr> writes:

piquemal> Thanks again Peter for your help and patience!...
piquemal> I'm almost there (very close!)...

piquemal> Buildroot 2009.08 allowed me to build a quite close toochain
piquemal> (linux 2.6.30, gcc 3.4.6, uClibC 0.9.28.3) in relation to my
piquemal> target (linux 2.6.36, gcc 3.4.2, uClibC 0.9.28)

Great!

piquemal> Now I'm trying to cross-compile a helloworld sample.
piquemal> Works great in static and runs on target, but still have some building issue for dynamic linking (my end-goal to enjoy smaller binaries).

piquemal> mipsel-linux-uclibc-gcc -s -o hello hello.o main.o ?-mulibc

You normally shouldn't need -mulibc. Does it work without?

-- 
Bye, Peter Korsgaard 
