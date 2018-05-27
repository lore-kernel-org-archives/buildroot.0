From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 27 May 2018 14:40:51 +0000
Subject: [Buildroot] [Bug 11046] Git package binaries are ~180MB (compared
 to ~20MB in stable branches).
In-Reply-To: <bug-11046-163@https.bugs.busybox.net/>
References: <bug-11046-163@https.bugs.busybox.net/>
Message-ID: <bug-11046-163-Xlx69hlI3I@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11046

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
I was not able to reproduce the issue with the given config. The executables
are all hardlinked with eachother in both versions.

Are you sure you don't have some post-image script that clones the hardlinks?

I suspected patchelf as a potential culprit, but it does open(fileName, O_TRUNC
| O_WRONLY) which should preserve hardlinks (as proven by bug 11031).

Can you check if the copies are made during the install of git itself, or
during the target-finalize step, or maybe even during rootfs generation?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
