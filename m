From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jun 2014 09:42:21 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140616094221.7439A9D00A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #10 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-06-16 09:42:21 UTC ---
(In reply to comment #8)

> there is a discussion about this problem on the musl mailing list.
> Just if you are not subscribed.

Right, but I don't see our specific problem being taken into account. Rich
Felker concluded the thread with:

"""
Please note that these changes are not mandatory; at present,
everything works, but crtbegin.o and crtend.o are unnecessarily
bloated and this affects static binary size.
"""

Maybe we should tell him that the changes are breaking C++ exception handling
for glibc, when the musl patches are applied to gcc?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
