From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Feb 2014 08:27:56 +0000 (UTC)
Subject: [Buildroot] [Bug 6794] Busybox compiled from buildroot hangs on
 pass from intiramfs to init
In-Reply-To: <bug-6794-163@https.bugs.busybox.net/>
References: <bug-6794-163@https.bugs.busybox.net/>
Message-ID: <20140207082756.E53449C8AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6794

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-07 08:27:56 UTC ---
All binaries are stripped later in the build process, which explains the
difference between the binary in output/build/busybox... and the one in
output/target.

However, stripping should not affect runtime behavior.

Have you found a solution to this problem?
Is this an unmodified busybox version?

A workaround is to specify the busybox binary in option BR2_STRIP_EXCLUDE_FILES
but it is not a real solution of course.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
