From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Feb 2010 17:53:02 +0000 (UTC)
Subject: [Buildroot] [Bug 355] Please update WebKit - it doesn't compile!
In-Reply-To: <bug-355-163@https.bugs.busybox.net/>
References: <bug-355-163@https.bugs.busybox.net/>
Message-ID: <20100221175302.C0F287777C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=355


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-02-21 17:53:02 UTC ---
The problem is that pthread_get_attr_np() does not exist in uClibc. Only glibc
can compile WebKit as of today. Therefore, I've sent a patch today to make sure
that selecting WebKit is not possible when building with uClibc as the C
library:
 http://lists.busybox.net/pipermail/buildroot/2010-February/032141.html

Patches against uClibc to implement pthread_get_attr_np() or against WebKit to
allow not to use this function are welcome.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
