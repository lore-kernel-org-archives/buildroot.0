From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:44:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/unscd: disable on riscv32
In-Reply-To: <20210527201904.478811-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 May 2021 22:19:04 +0200")
References: <20210527201904.478811-1-fontaine.fabrice@gmail.com>
Message-ID: <878s3ikt19.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > unscd unconditionally uses __NR_clock_gettime which will raise the
 > following build failure on riscv32:

 > nscd-0.54.c:339:14: error: '__NR_clock_gettime' undeclared (first use in this function); did you mean 'clock_gettime'?
 >   339 |  if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, &ts))
 >       |              ^~~~~~~~~~~~~~~~~~
 >       |              clock_gettime

 > Fixes:
 >  - http://autobuild.buildroot.org/results/eb77b18f268d8e59c407f757662117a33d3f9ee3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
