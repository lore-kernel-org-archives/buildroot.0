From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 15 Oct 2016 15:31:12 +0000
Subject: [Buildroot] [Bug 8856] python tornado runtime wasn't met on
	buildroot 2016.02
In-Reply-To: <bug-8856-163@https.bugs.busybox.net/>
References: <bug-8856-163@https.bugs.busybox.net/>
Message-ID: <bug-8856-163-DGlQX8uGpS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8856

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This issue was fixed in c37648bac43344750bdff130cb3cda97fa9152f5.

In fact, we don't need to package python-backports-ssl-match-hostname because
Python 2.7.9, which we have in Buildroot provides what's needed. See the
detailed commit log of c37648bac43344750bdff130cb3cda97fa9152f5 for more
details.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
