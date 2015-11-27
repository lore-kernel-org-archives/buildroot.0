From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 19:30:39 +0100
Subject: [Buildroot] [PATCH] rpi-userland: fix musl compile
In-Reply-To: <1448645857-14999-1-git-send-email-sergio.prado@e-labworks.com>
 (Sergio Prado's message of "Fri, 27 Nov 2015 15:37:37 -0200")
References: <1448645857-14999-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <87h9k7qoq8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:

 > When building with musl, the build fails with a conflicting type
 > qualifier error.

 > This is because musl defines stdout and stderr as const pointers
 > and RaspiVidYUV.c adds an extern declaration as normal pointers.

 > Since this declaration already comes in on the header (stdio.h),
 > there is no need to add an extern declaration, so removes it.

 > Fixes:

 > http://autobuild.buildroot.net/results/27bd6f32cecdb4e7c95247c1feaf2732c1d8e3fa
 > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
