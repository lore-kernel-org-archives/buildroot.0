From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jul 2017 15:15:56 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-mAxLygPeTP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report!

Do you know which versions of isl are acceptable for gcc 4.9, 5.x, 6.x and 7.x
? Indeed, Buildroot support all those versions of gcc.

In addition, isl was originally not updated to 0.15 for the following reasons
(from package/isl/isl.mk):

# The latest 0.15 version is not yet compatible with cloog 0.18.3, so
# bumping isl is not possible until a new version of cloog is
# published.
ISL_VERSION = 0.14.1

So we would also need to look at which version of cloog is acceptable for the
different versions of gcc/isl. Is this something you can help us with?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
