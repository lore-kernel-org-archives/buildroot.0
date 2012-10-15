From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Oct 2012 08:53:52 +0200
Subject: [Buildroot] [PATCH] mplayer: fix compilation of NEON assembly
	in libavcodec
In-Reply-To: <87d30qadw4.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Wed, 10 Oct 2012 11:13:15 +0200")
References: <1349478193-13673-1-git-send-email-arnout@mind.be>
 <87pq4s3e0t.fsf@macbook.be.48ers.dk> <50749743.5010700@mind.be>
 <87d30qadw4.fsf@macbook.be.48ers.dk>
Message-ID: <87txtwxm2n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi Arnout,

 >>> Please document why this is needed (if it is) in the commit message and
 >>> resubmit, thanks.

 Arnout> neon fpu (like vfp* fpu) can only be used with the softfp abi,
 Arnout> so both are needed.  This is kind of standard ARM knowledge :-)

 Peter> It is? I've never done any real work on platforms with neon, so it's
 Peter> certainly a bit fussy to me, but I don't understand what the relation is
 Peter> with the calling convention.

 Peter> Aren't the new linaro toolchains hardfp and support neon?

 Peter> Googling a bit I see stuff like:

 Peter> http://wiki.meego.com/ARM/hardfp
 Peter> http://sources.redhat.com/ml/crossgcc/2012-07/msg00091.html

 Peter> http://wiki.debian.org/ArmHardFloatPort#GCC_floating-point_options
 Peter> mentions that neon + hardfp abi isn't supported by GCC 4.4, but
 Peter> otherwise doesn't mention that it cannot work.

Any comments on this?

-- 
Bye, Peter Korsgaard
