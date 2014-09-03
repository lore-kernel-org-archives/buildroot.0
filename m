From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 18:57:16 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] monit doesn't start with glibc 2.19 because
 geteuid() fails
In-Reply-To: <bug-7364-163@https.bugs.busybox.net/>
References: <bug-7364-163@https.bugs.busybox.net/>
Message-ID: <20140903185716.51F619D5D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-09-03 18:57:16 UTC ---
Normally, static linking with glibc is not possible, just because of
this issue: all that has to deal with names (usernames, groups,
hostnames...) need dynamic linking, becasue glibc uses libnss, which
dlopen()s the backend libraries, such as libnss_files.so.

How did you manage to have a statically-linked monit when using a
glibc toolchain? Care to share your .config, please?

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
