From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Feb 2011 13:34:59 +0000 (UTC)
Subject: [Buildroot] [Bug 3181] dhcp.mk copies S80dhcp-server to etc/init.d,
 not etc/init.d/
In-Reply-To: <bug-3181-163@https.bugs.busybox.net/>
References: <bug-3181-163@https.bugs.busybox.net/>
Message-ID: <20110201133459.3FFC28E5FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3181

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
You actually have to use install -D file dest/dir/file, otherwise it will fail
if dest/dir doesn't exist (which is the whole point of install -D).

Anyway, fixed in git - thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
