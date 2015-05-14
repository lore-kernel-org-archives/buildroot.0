From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 May 2015 11:01:32 +0200
Subject: [Buildroot] [PATCH 1/2] postgresql: avoid AC_TRY_RUN when
	testing snprintf()
In-Reply-To: <e2f2e9591f74058025374bfeb2f41de5b6d4c47d.1431461407.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 May 2015 23:10:06 +0300")
References: <e2f2e9591f74058025374bfeb2f41de5b6d4c47d.1431461407.git.baruch@tkos.co.il>
Message-ID: <87fv6zedn7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > A few snprintf() compatibility tests in config/c-library.m4 use AC_TRY_RUN
 > that doesn't work for cross compilation. As a result configure.in decides to
 > build a bundled implementation of snprintf(). This implementation calls
 > isnan(), but -lm is missing. This breaks link with libpq.so. Preseed the
 > correct values to make the configure script happy, and fix rsyslog build.

 > Fixes:
 > http://autobuild.buildroot.net/results/e76/e769982e3131581b38698c109c9bc5215e3d5b11/
 > http://autobuild.buildroot.net/results/2b9/2b9d3edc8341675455bc3b74d1e84c8c0c24c521/
 > http://autobuild.buildroot.net/results/2a8/2a80357237ed7225823a008b5ff02bab01269814/

 > and many more.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
