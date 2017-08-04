From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Aug 2017 17:37:30 +0000
Subject: [Buildroot] [Bug 10161] unable to build u-boot.imx reliably
In-Reply-To: <bug-10161-163@https.bugs.busybox.net/>
References: <bug-10161-163@https.bugs.busybox.net/>
Message-ID: <bug-10161-163-5zXktFLs8H@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10161

--- Comment #2 from Andrey Yurovsky <yurovsky@gmail.com> ---
Sorry, I meant to say I tried 2017.05 and 2017.07. I'll reproduce this and post
output, however the output is a bit unclear (even at V=1) because this is a
parallel make problem so we're dealing with some kind of race condition.

I believe that I can only reproduce it by building the way buildroot does (one
make invocation with multiple targets), the attached workaround patch shows
that we avoid the problem by invoking make twice.

I'll try to reproduce this with u-boot on its own. The Makefile portions
dealing with building a .imx image have changed significantly between 2017.05
and 2017.07.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
