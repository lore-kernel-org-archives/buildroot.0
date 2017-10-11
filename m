From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Oct 2017 13:28:05 +0000
Subject: [Buildroot] [Bug 10391] WiringPi retrieves wrong (old) version
In-Reply-To: <bug-10391-163@https.bugs.busybox.net/>
References: <bug-10391-163@https.bugs.busybox.net/>
Message-ID: <bug-10391-163-vB8kfZVCLk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10391

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Yes, I had some discussion with the bug reporter on IRC. Upstream tags 2.42 and
2.44 point to the exact same commit. There is only one commit *after* the 2.44
tag, and this commit mixes two things:

 - Updating the version to 2.44 in the VERSION file and elsewhere. Which
obviously should have been done before the 2.44 tag is created.

 - Adding support for the RPi Zero W, which has nothing to do with supporting
old or new kernels.

Hence, there is nothing to fix in Buildroot. We can upgrade wiringpi to the
latest version if we want to, but it's clearly not a bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
