From: Andreas Hilse <andreas.hilse@ipcomm.de>
Date: Wed, 5 Aug 2020 19:55:50 +0200 (CEST)
Subject: [Buildroot] sysklogd 1.6: messages from klogd are logged to user
 facility
Message-ID: <01bd01d66b51$a7eba690$f7c2f3b0$@ipcomm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot Team,

there is an issue with sysklogd 1.6 (buildroot 2020.02.3).

The package includes its own implementation of openlog/syslog/vsyslog in
src/syslog.c to be able to log kernel messages to the kern facility.
The included syslog/vsyslog functions are not the ones getting executed,
thus kernel messages are marked with the user facility when they arrive in
syslogd.
I guess there was a change in the Makefile or glibc 2.22-2.29 which
results in taking precedence for these functions compared to sysklogd
1.5.1 (buildroot 2016.08).

Can you suggest a workaround/patch for this or are there plans to move to
a newer version of sysklogd?
Or should we just switch to rsyslog/syslog-ng?

Thanks & best regards
Andreas Hilse
