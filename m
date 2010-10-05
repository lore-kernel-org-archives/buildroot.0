From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Oct 2010 21:48:07 +0200
Subject: [Buildroot] [PATCH 05/10] microcom: convert to gentargets
In-Reply-To: <AANLkTim76qFFMTStNN-D_ompE2Bcw+ZeT0aWgBE3bd=e@mail.gmail.com>
	(Martin Banky's message of "Tue, 5 Oct 2010 11:54:47 -0700")
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-5-git-send-email-Martin.Banky@gmail.com>
	<20101005112147.2bc80d0e@surf>
	<AANLkTim76qFFMTStNN-D_ompE2Bcw+ZeT0aWgBE3bd=e@mail.gmail.com>
Message-ID: <878w2cs9oo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Banky <Martin.Banky@gmail.com> writes:

 Martin> Thomas,

 Martin> ???? I guess I should have explained this better. What I meant
 Martin> about microcom being a flat archive, is that when you extract
 Martin> it, it does not create a directory for itself. It just sticks
 Martin> its files, without a directory being created, in the current
 Martin> directory. $(TAR_STRIP_COMPONENTS)=1 is 'Automatically detect
 Martin> tar --strip-path/components option', which, equates to either
 Martin> --strip-path or --strip-components, depending on the version of
 Martin> tar. Per the man page: --strip-components = 'strip NUMBER
 Martin> leading components from file names on extraction', which means
 Martin> that for microcom, which doesn't have a directory structure, it
 Martin> strips all the file names off, so no files actually get
 Martin> extracted. This in turn, means that the patch routine does not
 Martin> work. Hence, the reason for manually patching microcom. If you
 Martin> have a better solution, I'd appreciate it, if you would show
 Martin> me, because I couldn't figure one out. I hope this makes more
 Martin> sense.

Maybe we should just get rid of the microcom package instead? It was
integrated into busybox a few years ago, which is also why it was marked
as deprecated.

I'll remove it later this week unless someone complains.

-- 
Bye, Peter Korsgaard
