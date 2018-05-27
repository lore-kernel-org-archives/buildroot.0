From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 27 May 2018 20:25:50 +0000
Subject: [Buildroot] [Bug 11046] Git package binaries are ~180MB (compared
 to ~20MB in stable branches).
In-Reply-To: <bug-11046-163@https.bugs.busybox.net/>
References: <bug-11046-163@https.bugs.busybox.net/>
Message-ID: <bug-11046-163-KaIqpWOdv6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11046

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Paul Stewart from comment #2)
# The binaries are normal in target/usr/libexec/git-core. So I think you're on
the right track.

Ahh, now we are talking. This I can reproduce:

du -hs target images/rootfs.tar
17M     target
191M    images/rootfs.tar

I will take a closer look and see where this comes from.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
