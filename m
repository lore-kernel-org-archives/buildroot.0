From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 15:38:59 +0000 (UTC)
Subject: [Buildroot] [Bug 5318] Grub requires package rxvt to configure
In-Reply-To: <bug-5318-163@https.bugs.busybox.net/>
References: <bug-5318-163@https.bugs.busybox.net/>
Message-ID: <20130526153859.6C4C89A579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5318

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 15:37:50 UTC ---
The error was not related to Buildroot. When grub is linked with ncurses, it
uses the TERM environment variable to know which terminal type to use. In your
case, the TERM environment variable was set to rxvt, so it was trying to use
one. But you can set TERM to 'vt220' or to 'linux', and grub will not require
rxvt.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
