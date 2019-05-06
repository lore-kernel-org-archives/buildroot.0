From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 06 May 2019 10:11:03 +0000
Subject: [Buildroot] [Bug 11816] Only selected coreutils binaries are
 installed
In-Reply-To: <bug-11816-163@https.bugs.busybox.net/>
References: <bug-11816-163@https.bugs.busybox.net/>
Message-ID: <bug-11816-163-o5T4u4KnOk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11816

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
Ahh yes. In general, your best bet is to enable BR2_ROOTFS_MERGED_USR to get
rid of this class of issues.

With that said, I have pushed a commit adding base64 to _BIN_PROGS. I will also
cherry pick it for the next 2019.02.x update.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
