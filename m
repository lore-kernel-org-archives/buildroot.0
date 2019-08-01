From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 01 Aug 2019 16:22:58 +0000
Subject: [Buildroot] [Bug 12076] Patchelf can link against an incompatible
 libc++ version
In-Reply-To: <bug-12076-163@https.bugs.busybox.net/>
References: <bug-12076-163@https.bugs.busybox.net/>
Message-ID: <bug-12076-163-2zFGa0OI3U@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12076

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I don't really see how this can happen, since Buildroot is building patchelf
for the host before running it. The only reasons why it could fail like this is
if:

 - The patchelf binary is built on one system, and move to another, which has
an older libstdc++ library

 - The system on which you're doing the build has some kind of
configuration/installation issue, and the C++ programs being built cannot be
executed.

All what Buildroot is doing is to build host-patchelf, which basically uses
your system g++ compiler.

Could you attach the broken patchelf binary ? Could you also attach the build
log of the host-patchelf package ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
