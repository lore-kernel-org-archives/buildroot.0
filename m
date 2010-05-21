From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 22:57:03 +0000 (UTC)
Subject: [Buildroot] [Bug 75] arm buildroot "unrecognized option" error
In-Reply-To: <bug-75-163@https.bugs.busybox.net/>
References: <bug-75-163@https.bugs.busybox.net/>
Message-ID: <20100521225703.A79DC12E820@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=75

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I have been able to reproduce by adding '.' to the PATH. I will send in a few
minutes a pull request for a commit that adds a check at the beginning of
Buildroot execution: if PATH contains '.', then we error out and tell the user
about the issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
