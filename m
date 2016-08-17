From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 08:36:25 +0200
Subject: [Buildroot] [PATCH v2 2/2] wayland: fix musl build issue
In-Reply-To: <1471241742-28182-2-git-send-email-rahul.bedarkar@imgtec.com>
 (Rahul Bedarkar's message of "Mon, 15 Aug 2016 11:45:42 +0530")
References: <1471241742-28182-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1471241742-28182-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <87mvkbsxzq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <rahul.bedarkar@imgtec.com> writes:

 > With musl C library, we see following build failure.
 >   src/scanner.c: In function 'find_enumeration':
 >   src/scanner.c:811:2: error: unknown type name 'uint'
 >     uint idx = 0, j;
 >     ^

 > uint is defined in <sys/types.h> header. It is usually included by <stdlib.h>
 > but in musl stdlib.h doesn't include it.

 > This patch adds upstream patch where uint32_t is used instead of uint.

 > Fixes:

 >   http://autobuild.buildroot.net/results/fcf/fcf6dd3bd31f92eadbcae17338e5887a23e43ff9/

 > Cc: Khem Raj <raj.khem@gmail.com>
 > Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
 > ---
 > Changes v1 -> v2:
 >   - Backport upstream patch instead of adding new patch (suggested by Khem Raj)

Committed, thanks.

-- 
Bye, Peter Korsgaard
