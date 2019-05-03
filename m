From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 May 2019 07:55:52 +0000
Subject: [Buildroot] [Bug 11816] Only selected coreutils binaries are
 installed
In-Reply-To: <bug-11816-163@https.bugs.busybox.net/>
References: <bug-11816-163@https.bugs.busybox.net/>
Message-ID: <bug-11816-163-0osokwgxhv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11816

--- Comment #2 from Pete Morici <pmorici@dev295.com> ---
Upon closer inspection it seems what is happening is that when both busybox
base64 and coreutils are selected they get installed to different paths.  /bin
is ahead of /usr/bin in PATH and so the busybox version takes precedent. 
Adding base64 to COREUTILS_BIN_PROGS causes the coreutils version to be
installed in /bin instead of /usr/bin.

output/target/usr/bin/base64 -> coreutils
output/target/bin/base64 -> busybox

-- 
You are receiving this mail because:
You are on the CC list for the bug.
