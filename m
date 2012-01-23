From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Jan 2012 21:12:03 +0000 (UTC)
Subject: [Buildroot] [Bug 4429] buildroot 2011.08 does not build on Ubuntu
	11.10
In-Reply-To: <bug-4429-163@https.bugs.busybox.net/>
References: <bug-4429-163@https.bugs.busybox.net/>
Message-ID: <20120123211203.21F079032A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4429

--- Comment #4 from Scott Moser <smoser@ubuntu.com> 2012-01-23 21:12:02 UTC ---
I just hit this, it appears that the only thing that needs to be cleared from
the environment is SED.

ie, either of the following should work for you:
 env -u SED make ...
or
 unset SED

I've opened bug 920661 [1] against byobu to have it not set the environment
variable SED.

--
[1] https://bugs.launchpad.net/byobu/+bug/920661

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
