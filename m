From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Nov 2011 11:37:27 +0000 (UTC)
Subject: [Buildroot] [Bug 4484] libstdc++ has _GLIBCXX_HAVE_FENV_H undefined
 but uclibc appears to have a fenv.h
In-Reply-To: <bug-4484-163@https.bugs.busybox.net/>
References: <bug-4484-163@https.bugs.busybox.net/>
Message-ID: <20111129113727.71BF08F721@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4484

--- Comment #4 from jacek.kolo at gmail.com 2011-11-29 11:37:26 UTC ---
(In reply to comment #1)
> On what arch is this? uClibc currently only has basic fenv support for i386

I believe I hit this problem. I'm using a powerpc p2020 (e500 core based)
development board. The compilation ends with:

powerpc-unknown-linux-uclibc/libstdc++-v3/include/fenv.h:36:24: fatal error:
fenv.h: No such file or directory
compilation terminated.

Reproducible: always

Submitted my configuration file and full error log.

Solution for compiling without this error:
after getting the error
make uclibc-menuconfig
switch UCLIBC_HAS_FENV to [=y]

PS. bug reporting for the first time - please excuse any inconveniences

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
