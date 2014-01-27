From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jan 2014 15:11:31 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile: move skeleton overlay
	installations before strip step
In-Reply-To: <52E6063B.1060700@mind.be> (Arnout Vandecappelle's message of
 "Mon, 27 Jan 2014 08:09:47 +0100")
References: <1390530729-1830-1-git-send-email-danomimanchego123@gmail.com>
 <52E6063B.1060700@mind.be>
Message-ID: <87a9ehzf8s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 24/01/14 03:32, Danomi Manchego wrote:
 >> Nothing prevents the skeleton overlays from having pre-built

 >  Small nit: it's not a skeleton overlay, but a rootfs overlay (I first
 > thought you were talking about the skeleton, which is copied _before_
 > the build).

 >> executables or libraries in them.  Therefore, we should install
 >> the overlays prior to stripping, so that any such pre-built stuff
 >> gets stripped too.

 >  I'm not sure if I agree with this change. I like the current
 > situation where the rootfs-overlay is really copied verbatim and you
 > can trust it. If there are binaries in there, we can assume that the
 > user has the cross-compiler available to strip them if he wants that.

I agree. As it is now the user has full control, which is IMHO nice.

-- 
Bye, Peter Korsgaard
