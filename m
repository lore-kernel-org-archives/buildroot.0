From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Apr 2015 23:36:24 +0200
Subject: [Buildroot] config choices in building for beaglebone black
	(BBB)?
In-Reply-To: <55302A4C.5050109@mind.be> (Arnout Vandecappelle's message of
 "Thu, 16 Apr 2015 23:31:56 +0200")
References: <alpine.LFD.2.11.1504160857510.20888@localhost>
 <55302A4C.5050109@mind.be>
Message-ID: <87wq16trc7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> also, for bleeding edge, can anyone verify whether i'm safe pushing
 >> the versions of everything right to the latest? you know:
 >> 
 >> * kernel 4.0.x
 >> * glibc 2.21
 >> * binutils 2.25
 >> * gcc 4.9.x

 >  For binutils and gcc and uClibc we typically stick to the buildroot default
 > versions (even though we don't actually test all defconfigs when we change the
 > default version for one of those...).

We don't do runtime testing (very time consuming and we don't have
access to all boards), but the defconfigs do get build tested.

 >  In case of BBB, I'm not 100% sure if all the graphics stuff from the TI kernel
 > has been fully upstreamed, so switching to a mainline kernel is not necessarily
 > acceptable. Even though the buildroot defconfig doesn't include graphics
 > support, we do want to offer a kernel that supports everything that the board has.

Indeed. That and the cape handling. It really depends on what you need
to do with the hw.

-- 
Bye, Peter Korsgaard
