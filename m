From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 08:36:12 +0200
Subject: [Buildroot] [PATCH v2 1/2] mtd: fix musl build issue
In-Reply-To: <1471241742-28182-1-git-send-email-rahul.bedarkar@imgtec.com>
 (Rahul Bedarkar's message of "Mon, 15 Aug 2016 11:45:41 +0530")
References: <1471241742-28182-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <87r39nsy03.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <rahul.bedarkar@imgtec.com> writes:

 > With musl C library, we get following build error
 >   integck.c:37:28: fatal error: bits/stdio_lim.h: No such file or directory
 >    #include <bits/stdio_lim.h>
 >                               ^
 >   compilation terminated.
 >   make[2]: *** [integck] Error 1

 > Header <bits/stdio_lim.h> is not available in musl C library. However
 > <stdio.h> has all definition that <bits/stdio_lim.h> supposed to be
 > providing. Moreover <bits/stdio_lim.h> shouldn't be included directly
 > instead we should be using <stdio.h>.

 > Since we already include <stdio.h> and in case of uClibc or glibc
 > <bits/stdio_lim.h> gets included internally, we can safely remove it.

 > Fixes:

 >   http://autobuild.buildroot.net/results/175/1754861457af520480cc34d7d2d0edff2868ff66/

 > Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Committed, thanks.

Please submit the change upstream as well.

-- 
Bye, Peter Korsgaard
