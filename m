From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 12:25:39 +0200
Subject: [Buildroot] [RFCv1 0/8] musl C library support in internal
	backend
In-Reply-To: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 24 Apr 2014 00:14:24 +0200")
References: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjixkfh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > The following patches, at the RFC stage, add support for the musl C
 > library in the internal toolchain backend.

 > At this point, I'm mainly interested in having people:

 >  * Test the musl stuff, for various architectures, both build time and
 >    run time tests.

 >  * But also tests of your usual configuration (uClibc or glibc). The
 >    reason is that the musl supports requires gcc patches, and they can
 >    in some ways cause issues when building with other C libraries
 >    (I've already fixed a bunch of them, but more testing is welcome).

Thanks. I have done a qemu_arm_versatile build with uclibc and with
musl, and everything seems to work fine (except for the dynamic loader
symlink).

The gcc patches look fairly safe to me, and I think we should include it
(with the experimental note) in 2014.05.

Care to send an updated series fixing the issues I pointed out?

-- 
Bye, Peter Korsgaard
