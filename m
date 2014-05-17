From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 11:38:35 +0200
Subject: [Buildroot] [PATCH] sane-backends: uses fork(),
	not available on noMMU systems
In-Reply-To: <1400319074-3056-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 May 2014 11:31:14 +0200")
References: <1400319074-3056-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k39koick.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > sane-backends currently doesn't build with the ADI external
 > toolchains, due to an internal compiler failure. However, using the
 > internal toolchain backend for Blackfin goes past this internal
 > compiler failure, but raises the problem that sane-backends uses
 > fork(). Sane-backends has a --enable-pthreads option that allows to
 > use threads instead of forking in some parts of sane, but there are
 > still some other areas of sane-backends that continue to use fork().

 > Since the probability of using sane-backends on a noMMU system is
 > fairly small, we'll just disable this package for now on such
 > architectures, until someone cares enough to investigate deeper.

 > Fixes:

 >   http://autobuild.buildroot.org/results/136/136100c3a2d843b7915fdd83d23d8b301fee577e/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
