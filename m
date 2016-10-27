From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Oct 2016 23:08:51 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-7IpBrQbspE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #7 from Andrey Yurovsky <yurovsky@gmail.com> ---
Ok, I found a better workaround that may explain some of this (plus the
original workaround I posted must be wrong, please ignore that).

If I install (via dnf in my case) fakeroot and then in fs/common.mk change:

PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)

to just:

fakeroot -- $$(FAKEROOT_SCRIPT)

...everything works fine.  So the issue has something to do with the host tools
provided fakeroot and/or the path handed to that.  They're both version 1.20.2
so I'm guessing it's some path or environment issue.

For now I'll patch common.mk to eliminate the buildroot-provided fakeroot but I
would love to help get to the bottom of this (or understand what I'm doing
wrong).  Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
