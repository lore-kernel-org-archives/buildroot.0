From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Jan 2017 13:55:14 +0000
Subject: [Buildroot] [Bug 9606] xorg-server cannot build for ARM target
In-Reply-To: <bug-9606-163@https.bugs.busybox.net/>
References: <bug-9606-163@https.bugs.busybox.net/>
Message-ID: <bug-9606-163-eFvKuLtdJM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9606

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Are you building with musl? From a quick look, the logic in compiler.h hasn't
changed since ~2004. The problem is that musl doesn't implement the
ioperm/inb/outb interface on ARM.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
