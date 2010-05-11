From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 May 2010 08:55:14 +0200
Subject: [Buildroot] [PATCH 1/5] grep: give hints to ./configure on
	where gettext() is
In-Reply-To: <73fa57064639d2877081f70b1e176b1163cd4583.1273527584.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 10 May 2010 23:39:47 +0200")
References: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
	<cover.1273527584.git.thomas.petazzoni@free-electrons.com>
	<73fa57064639d2877081f70b1e176b1163cd4583.1273527584.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871vdj3p2l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The build of grep fails with:
 Thomas> fgrep.o: In function `add_count':
 Thomas> fgrep.c:(.text+0x90): undefined reference to `libintl_gettext'

 Thomas> This is because the ./configure script of grep thought that gettext
 Thomas> was part of the C library instead of part of libintl:

 Thomas> checking for GNU gettext in libc... (cached) yes

That must mean some other package has loaded the cache with wrong info.
We should fix that instead.

-- 
Bye, Peter Korsgaard
