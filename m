From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 20:57:28 +0000
Subject: [Buildroot] [Bug 10511] Packages get downloaded uncompressed with
 wget
In-Reply-To: <bug-10511-163@https.bugs.busybox.net/>
References: <bug-10511-163@https.bugs.busybox.net/>
Message-ID: <bug-10511-163-piIXKey0iL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10511

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the investigation. This problem has been fixed/worked-around
upstream by commit
http://git.savannah.gnu.org/cgit/wget.git/commit/?id=047746eb765d212cbf05afac16f4bd73257d8186
which ensures that .gz and .tgz files don't get uncompressed.

However wget 1.19.2 remains affected.

Options:

 - Ignore the problem, and leave users of 1.19.2 affected by the problem.

 - Bail out if wget 1.19.2 is used, and leave it to the user to use a suitable
wget version

 - Detect if wget >= 1.19.2, and pass --compression=none

Thoughts?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
