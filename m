From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 20 Sep 2010 23:26:05 +0200
Subject: [Buildroot] [ Patch 0/4] Fix for POSIX compliance
Message-ID: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds fixes for POSIX 1003.1-2008 compliance in some shell
scripts, with respect to string comparison. POSIX says that string
comparison in test(1) is done using a sing '='; using two is a bashism.
See:
  http://www.opengroup.org/onlinepubs/9699919799/utilities/test.html
  man 1 test
  man 1 bash

  [PATCH 1/4] toolchain: fix helpers for POSIX compliance
  [PATCH 2/4] skeleton: fix atstk1005, ststk100x and atngw100 for POSIX [...]
  [PATCH 3/4] scripts: fix for POSIX compliance
  [PATCH 4/4] package/tcl: fix for POSIX compliance

Totally untested (I lack the proper Atmel hardware, at least), but should be
harmless.

Note: I have done no other compliance checking at all, only string comparison.

Regards,
Yann E. MORIN.
