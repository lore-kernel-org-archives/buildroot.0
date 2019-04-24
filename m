From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 15:58:22 +0200
Subject: [Buildroot] [PATCH] package/syslog-ng: fix segfault on startup
 due to pthread_atfork
In-Reply-To: <20190410082600.29086-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 10 Apr 2019 10:26:00 +0200")
References: <20190410082600.29086-1-patrickdepinguin@gmail.com>
Message-ID: <87v9z3cxoh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > syslog-ng may segfault at startup (during library initialization, before
 > reaching main) in newer toolchains. I have witnessed it on aarch64 (but with
 > 32-bit arm userland) with glibc 2.28.

 > Problem is described in syslog-ng issue #2263 [1], which in turn leads to a
 > problem in 'ivykis' which is shipped with syslog-ng, see ivykis issue #15
 > [2].

 > Root cause is that 'pthread_atfork' is used by ivykis but searched by its
 > configure script in libpthread_nonshared only. In newer toolchains, it seems
 > this symbol is in libc_nonshared.

 > Apply a patch someone proposed via pullrequest [3] to the ivykis project,
 > but which is at this moment not yet merged upstream.

 > [1] https://github.com/balabit/syslog-ng/issues/2263
 > [2] https://github.com/buytenh/ivykis/issues/15
 > [3] https://github.com/buytenh/ivykis/pull/16

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
