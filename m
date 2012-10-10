From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Oct 2012 11:13:15 +0200
Subject: [Buildroot] [PATCH] mplayer: fix compilation of NEON assembly
	in libavcodec
In-Reply-To: <50749743.5010700@mind.be> (Arnout Vandecappelle's message of
 "Tue, 09 Oct 2012 23:29:39 +0200")
References: <1349478193-13673-1-git-send-email-arnout@mind.be>
 <87pq4s3e0t.fsf@macbook.be.48ers.dk> <50749743.5010700@mind.be>
Message-ID: <87d30qadw4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Please document why this is needed (if it is) in the commit message and
 >> resubmit, thanks.

 Arnout>  neon fpu (like vfp* fpu) can only be used with the softfp abi,
 Arnout> so both are needed.  This is kind of standard ARM knowledge :-)

It is? I've never done any real work on platforms with neon, so it's
certainly a bit fussy to me, but I don't understand what the relation is
with the calling convention.

Aren't the new linaro toolchains hardfp and support neon?

Googling a bit I see stuff like:

http://wiki.meego.com/ARM/hardfp
http://sources.redhat.com/ml/crossgcc/2012-07/msg00091.html

http://wiki.debian.org/ArmHardFloatPort#GCC_floating-point_options
mentions that neon + hardfp abi isn't supported by GCC 4.4, but
otherwise doesn't mention that it cannot work.

-- 
Bye, Peter Korsgaard
