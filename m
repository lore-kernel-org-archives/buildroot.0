From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 15 Jul 2017 07:12:39 +0000
Subject: [Buildroot] [Bug 10076] Makefile:4113: recipe for target 'all-gcc'
	failed
In-Reply-To: <bug-10076-163@https.bugs.busybox.net/>
References: <bug-10076-163@https.bugs.busybox.net/>
Message-ID: <bug-10076-163-v9pQPyOvQm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10076

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
The s-attrtab program is known to require a lot of memory. So in your case,
your VM most likely doesn't have enough RAM, and therefore the Linux kernel
running inside the VM kills the s-attrtab program because it tries to consume
too much memory compared to the available memory.

You can check in /var/log/messages if you see an out of memory message from the
kernel.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
