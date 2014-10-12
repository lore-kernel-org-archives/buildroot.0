From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 19:43:52 +0200
Subject: [Buildroot] [PATCH] valgrind: add patch to fix build on PowerPC
	uClibc
In-Reply-To: <1413134834-7464-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 12 Oct 2014 19:27:14 +0200")
References: <1413134834-7464-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnphtc87.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > uClibc on PowerPC forgot to define some PTRACE_* definitions. Even
 > though the Buildroot uClibc package has a fix for this, it doesn't fix
 > external uClibc toolchains that are not patched. Therefore this commit
 > adds a patch to Valgrind to workaround the problem by defining
 > PTRACE_GETSIGINFO to the appropriate value on PowerPC when it's not
 > defined by the C library.

 > Fixes:

 >   http://autobuild.buildroot.org/results/bc6/bc6be9aa1ad39201a1045a65c0c3eb1e968371f2/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
