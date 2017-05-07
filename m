From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 07 May 2017 19:34:54 +0000
Subject: [Buildroot] [Bug 9846] musl libc not installed correctly in target
	folder
In-Reply-To: <bug-9846-163@https.bugs.busybox.net/>
References: <bug-9846-163@https.bugs.busybox.net/>
Message-ID: <bug-9846-163-axMbp7PuyX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9846

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your report. Unfortunately, I'm not able to reproduce. The musl
system produced by your defconfig looks OK to me:

$ ls -l target/lib/libc.so 
-rwxr-xr-x 1 test test 587296 May  7 15:29 target/lib/libc.so

And it boots just fine (tested under Qemu):

Welcome to TEST
test login: 
Welcome to TEST
test login: 

So, a few options:

 1. Something has been fixed since then, but I don't recall any fix related to
this being applied recently.

 2. Something is different on your build machine.

 3. You did not clean up the build completely.

I'll mark the bug as WORKSFORME for now. If you manage to reproduce again with
the latest Buildroot, could you try to preview a simpler defconfig that
exhibits the issue so that we can try to narrow down the issue ?

Keeping the full build log would also be useful.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
