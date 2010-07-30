From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jul 2010 10:21:06 +0200
Subject: [Buildroot] [PATCH 17/19] libcurl: bump version to fix build
	issue
In-Reply-To: <28ac3c6785961411af29a9d22388697610b55667.1280440124.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Thu, 29 Jul 2010 23:49:00 +0200")
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
	<cover.1280440124.git.thomas.petazzoni@free-electrons.com>
	<28ac3c6785961411af29a9d22388697610b55667.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k4odl6rx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The ./configure script of libcurl includes <arpa_inet.h> instead of
 Thomas> <arpa/inet.h> when testing for inet_pton(). The test fails, but it
 Thomas> doesn't prevent libcurl to build as it can work without inet_pton().

 Thomas> However, it fills the configure cache with the fact that inet_pton()
 Thomas> does not exist. And later, tcpreplay reads this from the configure
 Thomas> cache and fails to build, because tcpreplay really need inet_pton().

 Thomas> Unfortunately, just fixing the .m4 file doesn't work because the
 Thomas> autoreconfiguration of the package fails. Since the fix for this
 Thomas> problem is already upstream, the easiest solution is therefore to bump
 Thomas> libcurl.

 Thomas> The libcurl-7.19.2-fix-ssl-no-verbose.patch patch is no longer needed.

 Thomas> Since we're patching a m4 file, we must autoreconfigure the package.

This line is no longer valid.

-- 
Bye, Peter Korsgaard
