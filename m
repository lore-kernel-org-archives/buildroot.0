From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Jul 2017 21:49:27 +0000
Subject: [Buildroot] [Bug 10036] Buildroot builds Raspbian Jessie headless
 image presenting incorrect prompt
In-Reply-To: <bug-10036-163@https.bugs.busybox.net/>
References: <bug-10036-163@https.bugs.busybox.net/>
Message-ID: <bug-10036-163-0x3Eu1liWX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10036

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> ---
Please use the mailing list or IRC for questions. The bug tracker is for
reporting bugs.

The "buildroot login:" prompt appears because your system is configured with
"buildroot" as hostname - this is the default. If you want to change this, look
for the BR2_TARGET_GENERIC_HOSTNAME in "make menuconfig".

sudo is not found because you have not installed it. Look for BR2_PACKAGE_SUDO
in "make menuconfig".

If all this is not clear, you may want to consult
http://buildroot.org/manual.html

By the way, you can't build a raspbian image from Buildroot, there are quite a
few Required packages missing and the skeleton is different.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
