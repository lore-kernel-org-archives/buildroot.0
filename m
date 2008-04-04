From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Apr 2008 20:02:26 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
In-Reply-To: <0f8401c8966c$f30cb5f0$f52f9e86@LPSC0173W> (Guillaume Dargaud's
	message of "Fri\, 4 Apr 2008 18\:00\:00 +0200")
References: <87ve2xubdp.fsf@macbook.be.48ers.dk>
	<0f4a01c8964f$bbc064b0$f52f9e86@LPSC0173W>
	<20080404141058.GA30388@mx.loc>
	<0f8401c8966c$f30cb5f0$f52f9e86@LPSC0173W>
Message-ID: <87y77tlcr1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

 >>>> Ok. I don't have such an old GCC on my system so I cannot test. Maybe
 >>>> you will have more luck if you select GCC 3.4.6 in buildroot instead?

 Guillaume> OK, big system upgrade, I'm now at gcc 4.1.2 and I seem to
 Guillaume> be able to compile so far (haven't tried the kernel yet).

Great.

 Guillaume> One thing to note: changing options in menuconfig is often
 Guillaume> poorly reflected in the 'makes' underneath and no amount
 Guillaume> of 'make clean' or 'make distclean' can make it
 Guillaume> right. Restarting from a clean svn and copying the .config
 Guillaume> file works though, but that's rather a big waste of time
 Guillaume> like in the case of strip/sstrip/none for instance.

True. I most of the time just do a rm -rf *build* after changing stuff.

 Guillaume> Side question: where to best learn how to make a bootable
 Guillaume> ACE file for the Xilinx architecture from a kernel and, I
 Guillaume> assume, a bootloader ? Or in other words, how do I use the
 Guillaume> U-Boot option of buildroot ?

Hmm, I have never used the systemace stuff, have you checked Grant
Likely's wiki? (http://wiki.secretlab.ca).

For the U-boot stuff, it's probably easier to build it by hand instead
of using buildroot while you are porting it to your board / tweaking
stuff.

-- 
Bye, Peter Korsgaard
