From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 07 Jun 2018 15:28:59 +0000
Subject: [Buildroot] [Bug 9411] MUSL build with RT Error relocating
 /lib/libgcc_s.so.1: __cpu_indicator_init: symbol not found
In-Reply-To: <bug-9411-163@https.bugs.busybox.net/>
References: <bug-9411-163@https.bugs.busybox.net/>
Message-ID: <bug-9411-163-4nqKBqDj5e@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9411

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This problem has been fixed in upstream gcc as of commit
6e6c7fc1e15525a10f48d4f5ac2edd853e2f5cb7, which was part of 7.x.

It was backported to the gcc 6.x branch as of commit
0fbe404007e6ef32d4d95c74a6c84b9166946ca3, available since gcc 6.3.0.

And the problem didn't exist in gcc 6.x. Therefore, I'm happy to say that this
problem seems to be fixed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
