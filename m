From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 29 Jul 2019 14:38:44 +0000
Subject: [Buildroot] [Bug 12016] Grub fails to boot bzImage after upgrade to
 2019.05
In-Reply-To: <bug-12016-163@https.bugs.busybox.net/>
References: <bug-12016-163@https.bugs.busybox.net/>
Message-ID: <bug-12016-163-P1O1LF6pLh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12016

Wojciech Ziniewicz <wojciech.ziniewicz@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Wojciech Ziniewicz <wojciech.ziniewicz@gmail.com> ---
Hey,

After more and more testing we've found out what was the issue. We were using
cache in our build system and with enough many changes to the configuration we
ended up with some sort of cache-polluted unbootable state. Removing the cache
and switching back from -O3 to -O2 fixed the issue once and for all.

This can be safely closed now.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
