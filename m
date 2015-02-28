From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 28 Feb 2015 15:20:02 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <20150228152002.90271805CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #5 from nroach44 at gmail.com 2015-02-28 15:20:01 UTC ---
Further testing has shown that editing tmpfiles.d to create the folders results
in them being used, and seems to stop the logspam, but journalctl still reports
no logs were found.

Testing on the x86 machine has shown that after commit (not inclusive)
cb8ce5f0016fa14f5e6971e07416ed465e641ff7 all builds tested resulted in the same
issue.

The bug was likely introduced in d380dde1d2878bd8f09317081960bfc82b0f420b
("skeleton: make /run a proper directory/filesystem"), but that build fails.
(The build failure was fixed in c6ca6fc9a3714842485618676390aba114442511)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
