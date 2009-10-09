From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 13:19:12 +0200
Subject: [Buildroot] [PATCH 06/10] *-menuconfig needs dirs to exist
In-Reply-To: <20091009093821.GG2266@mx.loc> (Bernhard Reutner-Fischer's
	message of "Fri\, 9 Oct 2009 11\:38\:21 +0200")
References: <87my43j6b6.fsf@macbook.be.48ers.dk>
	<cover.1254994304.git.rep.dot.nop@gmail.com>
	<2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
	<874oq9iukr.fsf@macbook.be.48ers.dk> <20091008190847.GB2266@mx.loc>
	<87zl81hbed.fsf@macbook.be.48ers.dk> <20091009093821.GG2266@mx.loc>
Message-ID: <87vdiohl1r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> my bad, you're right that i did:
 Bernhard> $ git clone
 Bernhard> $ make defconfig
 Bernhard> $ rm -rf output

defconfig doesn't create output.

 Bernhard> somebody should fix the clean targets!!
 Bernhard> $ make linux26-menuconfig

 Bernhard> and that failed.

Yes, with:
make: *** No rule to make target `linux26-menuconfig'.  Stop.

which makes sense as the defconfig rightly doesn't have the Linux kernel
enabled - It does have busybox+uclibc enabled, and their -menuconfig
targets work.

Are you seing something else?

-- 
Bye, Peter Korsgaard
