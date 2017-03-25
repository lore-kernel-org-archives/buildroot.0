From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 25 Mar 2017 13:44:31 +0000
Subject: [Buildroot] [Bug 8831] image generation fails on host ZFS due to
	"no free space"
In-Reply-To: <bug-8831-163@https.bugs.busybox.net/>
References: <bug-8831-163@https.bugs.busybox.net/>
Message-ID: <bug-8831-163-TtcGn6LdVE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8831

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We have dropped support for auto-calculating the size of the ext2 filesystem:
the size *must* now be passed in a Buildroot option. See
https://git.buildroot.org/buildroot/commit/?id=c6bca8cef0310bc649240b451989457ce94a8358.

Therefore, the issue raised by this bug can no longer be encountered.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
