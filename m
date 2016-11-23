From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Nov 2016 12:56:25 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-U5U9Emw25l@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #15 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
And indeed, installing Fedora's fakeroot, and changing
$$(HOST_DIR)/usr/bin/fakeroot to just /usr/bin/fakeroot makes everything work.

So there is a difference in the fakeroot source code, or the way we build it,
we makes our fakeroot behave badly on SELinux enabled systems.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
