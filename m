From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Feb 2020 15:56:42 +0000
Subject: [Buildroot] [Bug 12571] ltp-testsuite : Build failure
In-Reply-To: <bug-12571-163@https.bugs.busybox.net/>
References: <bug-12571-163@https.bugs.busybox.net/>
Message-ID: <bug-12571-163-uJe2Z06Kll@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12571

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
There is no bug here: your ext4 filesystem image is now larger, but you haven't
adjusted your genimage configuration file to accommodate a larger ext4
filesystem. Your genimage configuration file has a rootfs partition of 512 MB,
so trying to fit a 64 GB filesystem in there obviously doesn't work.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
