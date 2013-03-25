From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Mar 2013 23:36:53 +0100
Subject: [Buildroot] [PATCH] redis: build fix and minor improvement
In-Reply-To: <1364246134-30923-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 25 Mar 2013 22:15:34 +0100")
References: <1364246134-30923-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y5db9ke2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The redis-001-uclibc.patch was properly adding conditionals to ensure
 Thomas> HAVE_BACKTRACE is not defined when uClibc is used. However, __unix
 Thomas> doesn't seem to be define with the toolchain Peter uses on gcc14, so
 Thomas> the <features.h> doesn't get included, therefore __UCLIBC isn't
 Thomas> defined, and the code believes that backtrace support is available. We
 Thomas> fix this by including <features.h> when __linux__ is defined.

 Thomas> Fixes:
 Thomas> http://autobuild.buildroot.org/results/4ba818f877af145a547a1fede0bb738192c2f181/build-end.log.

Committed, thanks.

-- 
Bye, Peter Korsgaard
