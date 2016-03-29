From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Mar 2016 21:23:34 +0000
Subject: [Buildroot] [Bug 8831] image generation fails on host ZFS due to
	"no free space"
In-Reply-To: <bug-8831-163@https.bugs.busybox.net/>
References: <bug-8831-163@https.bugs.busybox.net/>
Message-ID: <bug-8831-163-R2X2dCj914@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8831

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Maybe it's time we switch to use e2fsprogs from their 'next' branch,
rather than our canned script?

The upstream e2fsprogs now has the ability to fill-in the generated
filesystem from the content of an existing directory (with the new -d
option).

FWIW, Debian is now using a snapshot of 2016-03-15 in Stretch (testing)
and they have a single patch on top of that. I'd rather trust Debian.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
