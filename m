From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Sep 2019 11:30:29 +0000
Subject: [Buildroot] [Bug 12241] Permission denied while running "make"
In-Reply-To: <bug-12241-163@https.bugs.busybox.net/>
References: <bug-12241-163@https.bugs.busybox.net/>
Message-ID: <bug-12241-163-F5cigLr2Ci@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12241

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
(In reply to Carlos Santos from comment #3)
Good finding Carlos! Is mounting /tmp with noexec a common thing? From a quick
Google search seems like a number of people are recommending to do this. Not
sure if this is good advice.

But, for this specific case, Buildroot generally puts all its generated
contents in $(O), even temporary things. Perhaps we should do the same for this
check-headers script?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
