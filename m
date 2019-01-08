From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Jan 2019 21:35:07 +0100
Subject: [Buildroot] [PATCH] package/grpc: fix build on non-NPTL systems
In-Reply-To: <20181231161123.12693-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 31 Dec 2018 17:11:23 +0100")
References: <20181231161123.12693-1-thomas.petazzoni@bootlin.com>
Message-ID: <87zhsasxac.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > uClibc-ng in non-NPTL configurations doesn't implement
 > pthread_setname_np(). Unfortunately grpc assumes that as soon as
 > __GLIBC__ is defined, pthread_setname_np() is available. It is
 > particularly sad, because grpc build system uses CMake, so it is
 > trivial to do such a check.

 > This commit adds a patch that does just this: check for the
 > availability of pthread_setname_np(), and use it only if
 > available. The patch has been submitted upstream.

 > Fixes:

 >   http://autobuild.buildroot.org/results/47991306abbcd80fb8e6baad0bd7490fa74f696c/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
