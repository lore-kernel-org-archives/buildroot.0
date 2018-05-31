From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 May 2018 08:30:52 +0000
Subject: [Buildroot] [Bug 11056] Compiling a file that uses libdrm headers
 fails with: fatal error: drm.h: No such file or directory
In-Reply-To: <bug-11056-163@https.bugs.busybox.net/>
References: <bug-11056-163@https.bugs.busybox.net/>
Message-ID: <bug-11056-163-r0E7hr3ehA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11056

Ciro Santilli <ciro.santilli@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Ciro Santilli <ciro.santilli@gmail.com> ---
Ah, as it usually happens, after posting something publicly I triple checked
everything to not look silly and noticed that drm.h is part of the Linux kernel
uapi, is in staging, and I passed -I and -l and it worked!!

I will try to use pkgconfig later on.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
