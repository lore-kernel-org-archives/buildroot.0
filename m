From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2020 08:23:27 +0200
Subject: [Buildroot] [git commit] package/sysrepo: fix SysV init script
In-Reply-To: <20200531081039.5FA1485D87@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 31 May 2020 10:27:01 +0200")
References: <20200531081039.5FA1485D87@busybox.osuosl.org>
Message-ID: <87d06idm00.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=1a14a838eaa88ae683bf8c0cb0ae6cc7e1d10d49
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The current script (S51sysrepo-plugind) is not able to stop the daemon.

 > Possible options to fix the problem:

 > A) By adding the "-m -p $PIDFILE" option to start the pid file will be
 >    created but it will not contain the correct PID used by the daemon.
 >    This is obviously because the daemon forks.
 > B) By not starting the daemon in background (sysrepo-plugind -d) and
 >    let do it by start-stop-daemon with "-b" option. But then the log
 >    messages of the daemon will not longer ends in the syslog but to stderr.
 > C) Start the daemon without a pidfile and stop the daemon with the
 >    "-x" option.

 > The only valid option is C to fix that.

 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 > [yann.morin.1998 at free.fr: introduce EXECUTABLE]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
