From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Jun 2014 14:04:56 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion and
 internal variables
In-Reply-To: <bug-7172-163@https.bugs.busybox.net/>
References: <bug-7172-163@https.bugs.busybox.net/>
Message-ID: <20140608140456.86DBA9CF1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-06-08 14:04:55 UTC ---
Not tested, but as $ORIGIN seems to be interpreted by make as ${O}RIGIN, then I
guess using $$ORIGIN would work correctly, or if you prefer $${ORIGIN}.

This moves the responsibility of the correct escaping to the user, but as
Samuel said there is no easy solution.

Once cleared out, we should document this in the manual though...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
