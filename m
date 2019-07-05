From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Jul 2019 21:11:43 +0000
Subject: [Buildroot] [Bug 11991] [numpy] segfault when compiling for RPi3
 64bits
In-Reply-To: <bug-11991-163@https.bugs.busybox.net/>
References: <bug-11991-163@https.bugs.busybox.net/>
Message-ID: <bug-11991-163-p2QCcxwRVg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11991

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Which GCC version? Mind to share your config/defconfig?

There is one more reference of the same compile failure on the web, see [1].

numpy/core/src/npymath/npy_math_internal.h.src:482:12: internal compiler error:
Segmentation fault
     return @kind@@c@(x, y);
            ^~~~~~~~~~~~~~~

Stating 'Bug does not occur when using -O0 on GCC 8.2.0 and does not occur at
all with GCC 9.1.0', mind to try a different compiler and/or optimization
setting?

Regards,
Peter

[1] https://github.com/numpy/numpy/issues/13622

-- 
You are receiving this mail because:
You are on the CC list for the bug.
