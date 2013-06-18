From: piquemal michel <michel_piquemal@yahoo.fr>
Date: Tue, 18 Jun 2013 14:06:16 +0100 (BST)
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <87li69tdqv.fsf@dell.be.48ers.dk>
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
Message-ID: <1371560776.84702.YahooMailNeo@web171502.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks again Peter for your help and patience!...
I'm almost there (very close!)...

Buildroot 2009.08 allowed me to build a quite close toochain (linux 2.6.30, gcc 3.4.6, uClibC 0.9.28.3) in relation to my target (linux 2.6.36, gcc 3.4.2, uClibC 0.9.28)


Had few small hiccups during build but necessary patches could be found along with updated location URLs for some packages.(below for records in case it can help anyone-else)
http://lists.busybox.net/pipermail/uclibc-cvs/2006-September/023471.html
http://snapshot.debian.org/archive/debian/20080427T000000Z/pool/main/f/fakeroot/fakeroot_1.9.5.tar.gz
https://bugs.busybox.net/show_bug.cgi?id=4171
http://sourceforge.net/projects/genext2fs/files/genext2fs/1.4/genext2fs-1.4.tar.gz/download


Now I'm trying to cross-compile a helloworld sample.
Works great in static and runs on target, but still have some building issue for dynamic linking (my end-goal to enjoy smaller binaries).

mipsel-linux-uclibc-gcc -s -o hello hello.o main.o ?-mulibc
/home/mpi/development/buildroot-2009.08/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-ld: warning: ld-uClibc.so.0, needed by /home/mpi/development/buildroot-2009.08/build_mipsel/staging_dir/lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libc.so, not found (try using -rpath or -rpath-link)

required libs are in:
buildroot-2009.08/build_mipsel/staging_dir/lib ?









----- Mail original -----
De?: Peter Korsgaard <jacmet@uclibc.org>
??: piquemal michel <michel_piquemal@yahoo.fr>
Cc?: Peter Korsgaard <jacmet@uclibc.org>; "buildroot at busybox.net" <buildroot@busybox.net>
Envoy? le : Lundi 17 juin 2013 9h09
Objet?: Re: Building with uClibc 0.9.28, Linux 2.6.36

>>>>> "piquemal" == piquemal michel <michel_piquemal@yahoo.fr> writes:

piquemal> target has been built with gcc 3.4.2...

piquemal> it does not seem I can select such old version with buildroot
piquemal> 2010-05 :( Hopefully one older buildroot version can support
piquemal> the right mix...

Yes, 3.4.x support was removed in October 2009, so perhaps 2009.08 is a
better option.

-- 
Bye, Peter Korsgaard
