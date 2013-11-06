From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 12:03:02 +0100
Subject: [Buildroot] [PATCH] busybox: minor fixes to S01logging
	bootscript
In-Reply-To: <1383732056-39746-1-git-send-email-javier.viguera@digi.com>
 (Javier Viguera's message of "Wed, 6 Nov 2013 11:00:56 +0100")
References: <1383732056-39746-1-git-send-email-javier.viguera@digi.com>
Message-ID: <87zjphlrmh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Javier" == Javier Viguera <javier.viguera@digi.com> writes:

 > * The PID file is not created unless the '-m' option is passed to
 >   start-stop-daemon.

 > * Remove the mark '-m 0' option as it's not supported by busybox's
 >   syslogd.

 > * Syslogd and Klogd forks to background by default giving as a result
 >   that the pid stored in the PID file is not correct. Let the
 >   background job be done by 'start-stop-daemon' by passing '-n'
 >   (foreground) to the daemons and '-b' to start-stop-daemon. This
 >   way the pid stored in the PID files is correct.

Committed, thanks.

-- 
Bye, Peter Korsgaard
