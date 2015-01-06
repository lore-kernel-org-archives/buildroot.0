From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Jan 2015 14:08:08 +0000 (UTC)
Subject: [Buildroot] [Bug 7766] logrotate default gzip path is usually wrong
In-Reply-To: <bug-7766-163@https.bugs.busybox.net/>
References: <bug-7766-163@https.bugs.busybox.net/>
Message-ID: <20150106140808.6D4C18043A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7766

Henrik Juul Pedersen <hjp@liab.dk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #1 from Henrik Juul Pedersen <hjp@liab.dk> 2015-01-06 14:08:08 UTC ---
After looking closer into the LSB and FSH, it seems that /bin is actually still
used by the standard, and it states:

The following programs, or symbolic links to programs, must be in /bin if the
corresponding subsystem is installed:
...
gzip    The GNU compression utility (optional)
gunzip    The GNU uncompression utility (optional)
...

So I guess that only looking for gzip in /bin/gzip is correct according to the
standard, and the real issue is why no symlink exist in /bin/ for the two
programs. I'll look into this, and possibly file another bug on the subject.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
