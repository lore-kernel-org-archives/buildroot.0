From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Oct 2014 18:15:28 +0000 (UTC)
Subject: [Buildroot] [Bug 7574] quota-4.01 fails to build statically
In-Reply-To: <bug-7574-163@https.bugs.busybox.net/>
References: <bug-7574-163@https.bugs.busybox.net/>
Message-ID: <20141028181528.0CFCFB0EE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7574

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-10-28 18:15:27 UTC ---
Normally, a separate variable LDLIBS is used for that purpose. This variable is
then included at the end of the link command line, unlike LDFLAGS. At least
this is the case in the implicit make recipes. I would assume that autotools
has a similar distinction.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
