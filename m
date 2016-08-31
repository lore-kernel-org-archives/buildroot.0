From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Aug 2016 19:47:17 +0000
Subject: [Buildroot] [Bug 7424] undefined reference to
	`__builtin_thread_pointer'
In-Reply-To: <bug-7424-163@https.bugs.busybox.net/>
References: <bug-7424-163@https.bugs.busybox.net/>
Message-ID: <bug-7424-163-6fev1tf68p@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7424

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #16 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?h=next&id=1bd02bc230e1b3b22ca3eb23fb3dcb91b878283a,
which simply removes the option to enable/disable TLS support. Now TLS support
is automatically enabled or disable in gcc depending on the selected C library
and its configuration.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
