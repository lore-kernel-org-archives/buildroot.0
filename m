From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 22 Jul 2014 14:27:01 +0200
Subject: [Buildroot] No ldconfig on target when using glibc
Message-ID: <20140722122701.GB29579@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Since version 215, systemd installs a unit file to run /sbin/ldconfig when
starting the target. Building a target image with systemd implies using a
glibc-based toolchain. But when doing so, ldconfig is not installed on the
target, which causes the unit to fail (the system is usable, though).

On the other hand, when building a target image with uClibc, ldconfig is
installed.

Is it a bug or a feature? Am I missing something?

Best regards,
ELB
