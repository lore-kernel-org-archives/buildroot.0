From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Sep 2014 09:41:45 +0200
Subject: [Buildroot] [PATCH] czmq: add patch to fix build issue with
	recent glibc
In-Reply-To: <1410298889-16889-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 9 Sep 2014 23:41:29 +0200")
References: <1410298889-16889-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zje7exc6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > glibc 2.20 is now warning when _BSD_SOURCE is used (as it's replaced
 > by _DEFAULT_SOURCE), and czmq has the bad idea of forcing the usage of
 > -Werror, causing build issues with the recent NIOS II toolchain based
 > on glibc 2.20.

 > This commit adds a patch to czmq to fix that. The patch has been
 > submitted upstream.

 > Fixes:

 >   http://autobuild.buildroot.org/results/64a/64a7eef2155248146e7f3a55e85fe60bc5b67791/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

It would also be good to get rid of the -Werror.

-- 
Bye, Peter Korsgaard
