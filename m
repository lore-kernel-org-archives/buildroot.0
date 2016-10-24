From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Oct 2016 21:56:19 +0000
Subject: [Buildroot] [Bug 8831] image generation fails on host ZFS due to
	"no free space"
In-Reply-To: <bug-8831-163@https.bugs.busybox.net/>
References: <bug-8831-163@https.bugs.busybox.net/>
Message-ID: <bug-8831-163-EQNqTX7FcQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8831

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
FWIW, the current release of e2fsprogs we have in Buildroot can generate
filesystem images:

./output/host/usr/sbin/mke2fs -d fs/ test.img 1024

However, it will *not* solve the problem: you still have to pass the size of
the filesystem to be created, either in number of blocks or in KB/MB/GB.
Therefore, we still have to estimate it (like we're doing today), and
potentially get it wrong.

Maybe it is simply impossible to automatically calculate the filesystem size,
and we should stop supporting auto-calculation, and instead ask the user to
fill in a size for the filesystem (either in blocks or KB/MB/GB).

Thoughts?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
