From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:08:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: disable tests
In-Reply-To: <20210528060023.773575-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 28 May 2021 08:00:23 +0200")
References: <20210528060023.773575-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7i5jxe5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disabling tests will fix the following build failures on riscv32:
 > select_poll_epoll.c:408:16: note: each undeclared identifier is
 > reported only once for each function it appears in
 > select_poll_epoll.c: In function 'ppoll_fds_ulong_max':
 > select_poll_epoll.c:440:16: error: 'SYS_ppoll' undeclared (first use
 > in this function); did you mean 'SYS_tkill'?
 >   440 |  ret = syscall(SYS_ppoll, ufds, ULONG_MAX, NULL, NULL);
 >       |                ^~~~~~~~~
 >       |                SYS_tkill
 > select_poll_epoll.c: In function 'pselect_invalid_fd':
 > select_poll_epoll.c:488:16: error: 'SYS_pselect6' undeclared (first
 > use in this function); did you mean 'SYS_semctl'?
 >   488 |  ret = syscall(SYS_pselect6, fd + 1, &rfds, NULL, NULL, NULL, NULL);
 >       |                ^~~~~~~~~~~~
 >       |                SYS_semctl

 > Fixes:
 >  - http://autobuild.buildroot.org/results/dd39188a7191efa512a51f18f4c34d9ee711a6a7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
