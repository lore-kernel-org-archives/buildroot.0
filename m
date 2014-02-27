From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Feb 2014 14:35:47 +0100
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: fix missing fallocate64() on
	nios2
In-Reply-To: <52FFB751.1090903@frajasalo.de> (Frank Bergmann's message of
 "Sat, 15 Feb 2014 19:52:01 +0100")
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
 <CAAEAJfBHZ_4hSWN+boCRCvxJbFC1+T_WN=Dv3oVM2yz0z=t5JQ@mail.gmail.com>
 <52FFA40D.1040100@rosho.de> <52FFB751.1090903@frajasalo.de>
Message-ID: <87ha7kadak.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Bergmann <frank@frajasalo.de> writes:

 > Nios2 is currently missing the fallocate64 system call. Because of
 > compiling the e2fsprogs package with _FILE_OFFSET_BITS=64 the fallocate
 > call is replaced by fallocate64 by the glibc. Therefor fallocate is
 > entirely disbaled while configuring the package.

 > e4defrag have to be disabled because it declares the fallocate64 but
 > the library have its own defined.

 > It fixes an autobuilder issue:
 > http://autobuild.buildroot.org/results/70a/70a47bd7392560cbc1c64769c8357c0b4c91ca3b/

 > Signed-off-by: Frank Bergmann <frank@frajasalo.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
