From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Jan 2011 10:39:09 +0000 (UTC)
Subject: [Buildroot] [Bug 3115] How about board specific makefiles?
In-Reply-To: <bug-3115-163@https.bugs.busybox.net/>
References: <bug-3115-163@https.bugs.busybox.net/>
Message-ID: <20110119103909.B8AF78A5FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3115

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
You can do that kind of stuff with the POST_BUILD_SCRIPT option today. E.G. add
a script in your board/<board>/ directory to do the copy, and adjust your
defconfig to use it. The script get called with TARGET_DIR as argument, so you
could get from there to the images directory.

Notice that this script is run before the filesystems are created, so this
doesn't work to rename filesystem images.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
