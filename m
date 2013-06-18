From: piquemal michel <michel_piquemal@yahoo.fr>
Date: Tue, 18 Jun 2013 19:13:20 +0100 (BST)
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <1371568310.52100.YahooMailNeo@web171504.mail.ir2.yahoo.com>
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
 <1371568310.52100.YahooMailNeo@web171504.mail.ir2.yahoo.com>
Message-ID: <1371579200.26794.YahooMailNeo@web171506.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

humm, it seems there might be some binutils incompabilities with gcc 3.4.x :(
Could that be the reason.
Then I have to go back to binutils 2.15 (used default 2.19.1) ...which is not in Buildroot 2009.08 pick-list...hugh!!
Any suggestion on yet another Buildroot version then?


Is there some sort of compatibility matrix somewhere so that I can pick a proper toolchain components mix and avoid trials/errors?

Thanks!




----- Mail original -----
De?: piquemal michel <michel_piquemal@yahoo.fr>
??: Peter Korsgaard <jacmet@uclibc.org>
Cc?: "buildroot at busybox.net" <buildroot@busybox.net>
Envoy? le : Mardi 18 juin 2013 17h11
Objet?: Re: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36

Peter>?You normally shouldn't need -mulibc. Does it work without?


Same error.
I'm wondering if it's not similar kind of issue than below:
http://git.uclibc.org/buildroot/commit/?h=95d7c269156de54c245b2c43343e034c9eb479f9&id=fd3bb17cbb87e2cbcc6dce5b70c87daa2904a95d


I hope this path think can be resolved by some LDFLAG directives or so.



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


-- 
Bye, Peter Korsgaard 
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot 
