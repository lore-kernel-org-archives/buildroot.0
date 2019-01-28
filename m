From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 18:07:20 +0100
Subject: [Buildroot] [PATCH v1] apr: fix runtime tests for cross compile
In-Reply-To: <20190117193630.18533-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 17 Jan 2019 20:36:30 +0100")
References: <20190117193630.18533-1-ps.report@gmx.net>
Message-ID: <87bm40emnr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 >  - epoll supported since linux-2.5.44/glibc-2.3.2 (see [1])
 >  - dup3 supported since linux-2.6.27/glibc-2.9 (see [2])
 >  - SOCK_CLOEXEC supported on linux (see [3])
 >  - accept4 suppported since linux-2.6.28/glibc-2.10 (see [4])

 > Fixes [5] apache runtime failure:

 >   [mpm_event:crit] [pid 173:tid 1996214272] (70023)This function has not been
 >       implemented on this platform: AH00495: Couldn't create a Thread Safe Pollset.
 >       Is it supported on your platform?Also check system or user limits!
 >   [:emerg] [pid 173:tid 1996214272] AH00017: Pre-configuration failed, exiting

 > [1] http://man7.org/linux/man-pages/man7/epoll.7.html
 > [2] https://linux.die.net/man/2/dup3
 > [4] https://linux.die.net/man/2/accept4
 > [5] https://bugs.busybox.net/show_bug.cgi?id=11576

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Note:
 >   - one more option checked via AC_TRY_RUN
 > 	ac_cv_func_sem_open

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
