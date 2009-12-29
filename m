From: Terry Forrest <zippybot7@hotmail.com>
Date: Tue, 29 Dec 2009 14:44:51 -0500
Subject: [Buildroot] Multiple architectures best practices?
Message-ID: <BLU148-W126CE5F8A30A9DD8A9BAA5EB7A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



[apologies for the duplicate - previous note lacked a subject ] 

Hi All - new to buildroot and am impressed!  Nice design
and implementation.

We would like to use BR to build for two architectures from
the same tree.  We can use a local x86 for a "simulation" mode,
and the target is arm.  I see that this is cleanly supported in the
2009.11 release.

My question is on a "best practice" for this.  I've set up 
a top-level Makefile that goes something like this:


TOPDIR    = path_to_my_top
BUILD   = ${TOPDIR}/build
BUILDROOT = buildroot-2009.11
BROOT    = ${BUILD}/${BUILDROOT}

setup-x86:
    cp configs/buildroot-config-x86 ${BROOT}/.config
    ${MAKE} -C ${BROOT} oldconfig

setup-arm:
    cp configs/buildroot-config-arm ${BROOT}/.config
    ${MAKE} -C ${BROOT} oldconfig

build-x86: setup-x86
    make -C ${BROOT} O=${BUILD}/output_x86 

build-arm: setup-arm
    make -C ${BROOT} O=${BUILD}/output_arm

This seems to work okay - any comments or warnings?
Again, I'm new to BR and want to make sure I'm not 
gonna step in anything.

Thanks!
Terry 		 	   		  
_________________________________________________________________
Hotmail: Powerful Free email with security by Microsoft.
http://clk.atdmt.com/GBL/go/171222986/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091229/c036d76f/attachment.htm>
