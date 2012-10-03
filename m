From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Oct 2012 14:52:34 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20121003145234.69C21997A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #5 from richard.genoud at gmail.com 2012-10-03 14:52:33 UTC ---
(In reply to comment #4)
> Maxime is testing with a more recent kernel version (3.6). Maybe things have
> changed since 2.6.33/3.0 that you are testing?
> 
> Maxime, would be good if you could test with older kernel versions as well.
> They are not old enough to not support them in Buildroot (even though testing
> those DT related features with 2.6.33 is kind of useless since there was no DT
> on ARM at 2.6.33).

The 1st kernel I tested was 3.6-rc4.
I used the script against vanilla 3.6, and I still get zImage reconstructed.

besides, I'm not a Makefile guru, but the rule uImage needs zImage and FORCE
And the rule zImage needs compressed/vmlinux and FORCE
so it gets to be rebuilt. 
(by the way, compressed/vmlinux depends also on FORCE, like Image)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
