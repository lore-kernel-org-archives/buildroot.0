From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 Mar 2012 13:18:22 +0100
Subject: [Buildroot] Kernel and buildroot in 1MB
In-Reply-To: <4F4EC83C.7090208@yahoo.co.uk> (bifferos@yahoo.co.uk's message of
 "Thu, 01 Mar 2012 00:52:12 +0000")
References: <4F4EC83C.7090208@yahoo.co.uk>
Message-ID: <877gz48qgh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bifferos" == bifferos  <bifferos@yahoo.co.uk> writes:

 bifferos> Hi,

 bifferos> So far I have been using buildroot only to extract the
 bifferos> busybox binary and use it with my own hand-crafted rootfs,
 bifferos> because pretty much any binaries other than busybox put me
 bifferos> over the limit.  It would be nice to use the buildroot
 bifferos> filesystem as generated, so my question is this: If I build a
 bifferos> busybox statically linked to uclibc, how can I remove *all*
 bifferos> the other binaries, e.g. uclibc .so?  Or does the build
 bifferos> system not support that?

The .so files shouldn't get installed into target if you select
BR2_PREFER_STATIC_LINK, but in case there's some leftover extra you can
just remove it with a post-build script.

-- 
Bye, Peter Korsgaard
