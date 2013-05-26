From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 13:34:24 +0000 (UTC)
Subject: [Buildroot] [Bug 6080] Git fetch caching
In-Reply-To: <bug-6080-163@https.bugs.busybox.net/>
References: <bug-6080-163@https.bugs.busybox.net/>
Message-ID: <20130526133424.BB26F9A38D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6080

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 13:33:15 UTC ---
What do you call "nasty caching" ? The fact that Buildroot creates a tarball
stored in $(DL_DIR) is expected, and I don't think we want to disable that. If
your 'dma_maps-20130306' tag doesn't move, then Buildroot caching should not be
a problem.

Otherwise, if you're actively doing some development on the Linux kernel
sources, and therefore need Buildroot to restart the build of the kernel using
the modified sources, you should really be using LINUX_OVERRIDE_SRCDIR.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
