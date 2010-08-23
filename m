From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Aug 2010 07:42:51 +0200
Subject: [Buildroot] [PATCH 10/20] libglib2: add patch to rework
	clock_gettime() test
In-Reply-To: <7dfc97b926288b402f07f49c2464cf9fd48edbdd.1282471311.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 22 Aug 2010 12:52:02 +0200")
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
	<cover.1282471311.git.thomas.petazzoni@free-electrons.com>
	<7dfc97b926288b402f07f49c2464cf9fd48edbdd.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739u5khpg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The test for clock_gettime() in configure.in doesn't work properly
 Thomas> when a previous package has loaded the shared configuration cache with
 Thomas> informations about the availability of clock_gettime. A package such
 Thomas> as ctorrent does so, which means that compiling ctorrent *then*
 Thomas> libglib2 currently fails.

 Thomas> According to people on the Autoconf mailing list, the libglib2 test is
 Thomas> likely the one that needs to be fixed. The problem is that the
 Thomas> AC_CHECK_FUNCS() test assumes that if it finds clock_gettime() it
 Thomas> means that there's no need to add any -lrt flag to the
 Thomas> build. Unfortunately, due to the shared configuration cache, this test
 Thomas> is already done with -lrt, so the test succeeds, and libglib2 does not
 Thomas> know that it needs to add -lrt to G_THREAD_LIBS and
 Thomas> G_THREAD_LIBS_FOR_GTHREAD.

Thanks! It would be good to have a summary of the above in the patch
header itself. Have you sent this upstream?

-- 
Bye, Peter Korsgaard
