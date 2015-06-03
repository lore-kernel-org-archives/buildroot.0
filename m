From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Jun 2015 01:31:47 +0000 (UTC)
Subject: [Buildroot] [Bug 7628] Python SSL does not get built for Raspberry
	Pi
In-Reply-To: <bug-7628-163@https.bugs.busybox.net/>
References: <bug-7628-163@https.bugs.busybox.net/>
Message-ID: <20150603013147.F39C47FE17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7628

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-06-03 01:31:47 UTC ---
I believe it might have been a locale related issue, since having a non-english
locale would make the Python add_gcc_paths() logic to fail, and therefore it
wouldn't find the headers for OpenSSL.

This has been solved by commit
http://git.buildroot.net/buildroot/commit/package/python?id=238bf198cf4f31a3301b81a924d5e22044945955.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
