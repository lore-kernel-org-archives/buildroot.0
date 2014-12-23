From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Dec 2014 11:24:03 +0000 (UTC)
Subject: [Buildroot] [Bug 7742] dhcp lacks important features when
	BR2_ENABLE_DEBUG
In-Reply-To: <bug-7742-163@https.bugs.busybox.net/>
References: <bug-7742-163@https.bugs.busybox.net/>
Message-ID: <20141223112403.15FA980736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7742

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-12-23 11:24:02 UTC ---
Interesting, thanks for the report.

We have seen several cases of --enable-debug causing problems, and indeed the
help text of BR2_ENABLE_DEBUG only mentions that it's causing the packages to
be built with debugging symbols.

So, I would personally suggest that we simply do not pass --enable-debug when
BR2_ENABLE_DEBUG is set, and make BR2_ENABLE_DEBUG only enable debugging
symbols.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
