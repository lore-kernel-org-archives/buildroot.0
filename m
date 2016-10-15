From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 15 Oct 2016 15:49:31 +0000
Subject: [Buildroot] [Bug 9111] glibc 2.23: libmvec.so not copied
In-Reply-To: <bug-9111-163@https.bugs.busybox.net/>
References: <bug-9111-163@https.bugs.busybox.net/>
Message-ID: <bug-9111-163-udTDJX3em6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9111

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We had a discussion about this, and here is the conclusion: we will simply add
libmvec.so to the list of libraries to copy, for both the internal toolchain
backend (glibc.mk) and the external toolchain backend (toolchain-external.mk).

The function used to copy libraries from the staging directory to the target
directory already ignores libraries that don't exist, so it's not a problem to
unconditionally try to copy libmvec.so. It will be silently ignored on
systems/C libraries/architectures where it is not available.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
