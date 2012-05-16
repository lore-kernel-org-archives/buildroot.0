From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 May 2012 10:38:35 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: disable decimal
	floats
In-Reply-To: <201205160958.32997.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 16 May 2012 09:58:32 +0200")
References: <1337116550-12175-1-git-send-email-yann.morin.1998@free.fr>
 <4FB2D9B7.6050705@mind.be> <87ehqkr2tm.fsf@macbook.be.48ers.dk>
 <201205160958.32997.yann.morin.1998@free.fr>
Message-ID: <8762bwr050.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Arnout> Wouldn't it be better to enable FENV in buildroot's uClibc config?

 Yann> I did not want to impact the internal backend, thus the workaround is
 Yann> limited to the crosstool-NG backend. This limits the impact for the
 Yann> now-woon-to-be-released next version of BR.

 Yann> Switching to enabling fenv by default can be done in the next cycle.

Agreed, lets keep it simple for now.

 >> It's afaik only available for i386, and even then I believe some things
 >> are missing.

 Yann> khem told me yesterday on IRC that uClibc had a working fenv for all
 Yann> supported architectures, with no _known_ problems (which does not mean
 Yann> there is none, just that none is known so far):
 Yann>   http://ibot.rikers.org/%23uclibc/20120515.html.gz  @ 20:20:25 - 20:56.17

Yes, I saw that as well, but looking at the uClibc sources I only see .c
files for i386 and sh4.

-- 
Bye, Peter Korsgaard
