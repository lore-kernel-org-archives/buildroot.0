From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 25 Mar 2017 13:44:34 +0000
Subject: [Buildroot] [Bug 9496] mke2img fails during build on ntfs-3g host
	partition
In-Reply-To: <bug-9496-163@https.bugs.busybox.net/>
References: <bug-9496-163@https.bugs.busybox.net/>
Message-ID: <bug-9496-163-l9cWnq8iu9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9496

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We have dropped support for auto-calculating the size of the ext2 filesystem:
the size *must* now be passed in a Buildroot option. See
https://git.buildroot.org/buildroot/commit/?id=c6bca8cef0310bc649240b451989457ce94a8358.

Therefore, the issue raised by this bug can no longer be encountered.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
