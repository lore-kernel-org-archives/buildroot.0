From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 27 May 2018 20:51:10 +0000
Subject: [Buildroot] [Bug 11046] Git package binaries are ~180MB (compared
 to ~20MB in stable branches).
In-Reply-To: <bug-11046-163@https.bugs.busybox.net/>
References: <bug-11046-163@https.bugs.busybox.net/>
Message-ID: <bug-11046-163-UKs9uYKHk4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11046

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
This was indeed caused by a recent change to make a copy of output/target
before running the file system hooks and generate file systems, and this copy
used rsync without the -H (preserve hard links) option.

I have sent a patch to fix it:
http://patchwork.ozlabs.org/patch/921203/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
