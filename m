From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 22:51:53 +0200
Subject: [Buildroot] sysklogd 1.6: messages from klogd are logged to
 user facility
In-Reply-To: <01bd01d66b51$a7eba690$f7c2f3b0$@ipcomm.de>
References: <01bd01d66b51$a7eba690$f7c2f3b0$@ipcomm.de>
Message-ID: <20200805225153.7e4bb864@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Wed, 5 Aug 2020 19:55:50 +0200 (CEST)
Andreas Hilse <andreas.hilse@ipcomm.de> wrote:

> there is an issue with sysklogd 1.6 (buildroot 2020.02.3).
> 
> The package includes its own implementation of openlog/syslog/vsyslog in
> src/syslog.c to be able to log kernel messages to the kern facility.
> The included syslog/vsyslog functions are not the ones getting executed,
> thus kernel messages are marked with the user facility when they arrive in
> syslogd.
> I guess there was a change in the Makefile or glibc 2.22-2.29 which
> results in taking precedence for these functions compared to sysklogd
> 1.5.1 (buildroot 2016.08).
> 
> Can you suggest a workaround/patch for this or are there plans to move to
> a newer version of sysklogd?
> Or should we just switch to rsyslog/syslog-ng?

I am not really familiar with the internals of sysklogd, but there are
definitely newer versions available:

  https://github.com/troglobit/sysklogd/releases

Have you tried if version >= 2.0 would fix your issue ? It seems like
version 2.0 is really a major rewrite.

In any case, we would very much welcome Buildroot patches to update
sysklogd to a newer version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
