From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 May 2012 23:54:06 +0200
Subject: [Buildroot] [PATCH] gdb: adjust behavior when thread debug is
	not available
In-Reply-To: <1337263520-5865-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 17 May 2012 16:05:20 +0200")
References: <1337263520-5865-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wr4ao4n5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When an external toolchain without thread debug is used, the gdb
 Thomas> package can be selected, but no version can be choosen, since none
 Thomas> match any of the requirements. This leads Buildroot to try to build
 Thomas> gdb for the target without a version being defined, as in the
 Thomas> following build log:

 Thomas>  http://autobuild.buildroot.org/results/84e8fd2df0cc22448052a572c2e9a6e03dd137eb/build-end.log

 Thomas> To fix this, we adjust the dependencies of the BR2_PACKAGE_GDB option
 Thomas> so that the package as a whole is not selectable when the required
 Thomas> conditions are not met. Basically, we have the choice of:

 Thomas>  * Having a toolchain that supports thread debugging, which is needed
 Thomas>    for gdb >= 7.x

 Thomas>  * Having BR2_DEPRECATED enabled, which allows gdb 6.8 to be selected,
 Thomas>    which doesn't require thread debugging

 Thomas>  * Using either avr32 of bfin, since those architectures have special
 Thomas>    old gdb versions

Thanks, but this conflicts with your recent 'gdb: not available on
avr32' patch. Looking at that patch it seems you can drop the avr32
handling.

Care to fix and resend?

-- 
Bye, Peter Korsgaard
