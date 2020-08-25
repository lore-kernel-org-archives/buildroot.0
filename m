From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 Aug 2020 05:43:44 +0000
Subject: [Buildroot] [Bug 13141] Target-finalize fail with "depmod: ERROR:
 Bad version passed"
In-Reply-To: <bug-13141-163@https.bugs.busybox.net/>
References: <bug-13141-163@https.bugs.busybox.net/>
Message-ID: <bug-13141-163-3GVXm5VRdU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13141

--- Comment #4 from laurent at neko-labs.eu ---
(In reply to Asaf Kahlon from comment #2)
Asaf, Yann,

1/As suggested by asaf I checked my build script and I had:
make -C $BR_SOURCE O=$BR_BUILD -j`nproc` V=1

Removing -j`nproc` seems to remove the issue.

--> I did the test during the night, I'll recheck tonight to be sure.

2/Asaf you are right first time I build it failed (with -j`nproc`), then next
time it succeed, but I was suspecting that buildroot somehow .stamp'ed the
TARGET_FINALIZE stage.

Laurent

-- 
You are receiving this mail because:
You are on the CC list for the bug.
