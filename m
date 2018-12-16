From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:23:52 +0100
Subject: [Buildroot] [PATCH] package/uclibc: add custom bits/poll.h for
 xtensa
In-Reply-To: <20181212151314.19556-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Wed, 12 Dec 2018 07:13:14 -0800")
References: <20181212151314.19556-1-jcmvbkbc@gmail.com>
Message-ID: <87tvjd5fo7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Definitions of POLLWRNORM, POLLWRBAND and POLLREMOVE in xtensa linux
 > kernel are non-standard. Provide bits/poll.h with correct values for
 > these constants for uclibc-ng.

 > This fixes the following strace build errors:

 >   In file included from xlat/pollflags.h:4:0,
 >                    from poll.c:34:
 >   ./static_assert.h:40:24: error: static assertion failed: "POLLWRBAND != 0x0100"
 >    # define static_assert _Static_assert
 >                           ^
 >   xlat/pollflags.h:75:1: note: in expansion of macro ?static_assert?
 >    static_assert((POLLWRBAND) == (0x0100), "POLLWRBAND != 0x0100");
 >    ^~~~~~~~~~~~~
 >   ./static_assert.h:40:24: error: static assertion failed: "POLLREMOVE != 0x0800"
 >    # define static_assert _Static_assert
 >                           ^
 >   xlat/pollflags.h:117:1: note: in expansion of macro ?static_assert?
 >    static_assert((POLLREMOVE) == (0x0800), "POLLREMOVE != 0x0800");
 >    ^~~~~~~~~~~~~

 > Fixes:
 >  http://autobuild.buildroot.net/results/5a0112b7a2c81fa5253c9adc93efe415256cd811
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
