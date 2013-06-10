From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Jun 2013 15:15:14 +0000 (UTC)
Subject: [Buildroot] [Bug 6122] iconv.h missing for charconv.c build
In-Reply-To: <bug-6122-163@https.bugs.busybox.net/>
References: <bug-6122-163@https.bugs.busybox.net/>
Message-ID: <20130610151514.DD7E19ABA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6122

--- Comment #4 from Andrew Scheller <uclibc-bugzilla@loowis.durge.org> 2013-06-10 15:13:28 UTC ---
I just had this bug too, but I dunno what caused it, and I dunno how to
reproduce it!

For some unknown reason I was getting a fatal error during the compilation of
dosfstools 3.0.16 about charconv.c trying to include iconv.h but being unable
to. I tried investigating, but couldn't work out what was going wrong (I'm not
that familiar with buildroot or cross-compilation setups). So I did 'rm -r
output/build/dosfstools-3.0.16' followed by a 'make' and I still got the same
error. So tried investigating again, but didn't get anywhere. So then I did 'rm
-r output/build/dosfstools-3.0.16; rm -r output/build/libiconv-1.14' and to my
great surprise this time the 'make' worked fine.
So I dunno how buildroot / dosfstools / libiconv got itself into this funny
situation, but everything is building fine again now, and I dunno how to
reproduce the problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
