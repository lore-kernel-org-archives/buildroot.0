From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Oct 2009 17:23:14 +0000 (UTC)
Subject: [Buildroot] [Bug 665] [PATCH] Samba package
In-Reply-To: <bug-665-163@https.bugs.busybox.net/>
References: <bug-665-163@https.bugs.busybox.net/>
Message-ID: <20091018172314.DE9757778B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=665





--- Comment #8 from Sven Neumann <s.neumann@raumfeld.com>  2009-10-18 17:23:14 UTC ---
While trying to find the cause of the gvfs problem, I attempted to build the
updated samba package on my Debian sid system. This unveiled a problem in your
patch. Your patch adds a SAMBA_HOOK_POST_EXTRACT hook that calls the autogen.sh
script. This will regenerate the configure script (among other things).
Depending on the version of autoconf that is being called by autogen.sh, the
resulting configure script will differ. On my system this causes the
samba-do-not-check-glibc-version.patch to fail. If I remove the
SAMBA_HOOK_POST_EXTRACT hook entirely, everything works just fine. So it
appears this is not needed at all?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
