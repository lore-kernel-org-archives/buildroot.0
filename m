From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2009 14:21:05 +0000 (UTC)
Subject: [Buildroot] [Bug 561] ltp-testsuite failed to install
In-Reply-To: <bug-561-163@https.bugs.busybox.net/>
References: <bug-561-163@https.bugs.busybox.net/>
Message-ID: <20090811142105.CDF82777BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=561





--- Comment #1 from Will Newton <will.newton@gmail.com>  2009-08-11 14:21:04 UTC ---
(In reply to comment #0)
> Here is what I got when trying to generate an image for ARM with Linux 2.6.29
> and ltp-testsuite using buildroot 2009.08-rc2.
> 
> Applying ltp-testsuite-enable-openposix-for-nptl.patch using plaintext: 
> patching file testcases/Makefile
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- saving rejects to file testcases/Makefile.rej
> 
> Can I remove this patch safely ?
> 
> Also, because of the patch "ltp-testsuite-generate-needs-bash.patch" we should
> add bash as a dependency of ltp-testsuite.
> 

Removing the patch will reduce the coverage of testing by not enabling the Open
POSIX Test Suite. LTP contains lots more tests so it still covers many syscalls
etc. without the Open POSIX tests.

I don't think a dependency on bash is appropriate. LTP can run lots of
different subsets of tests, many of which do not require bash, and bash is a
big package to put on a small embedded system.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
