From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Apr 2012 08:41:31 +0000 (UTC)
Subject: [Buildroot] [Bug 4970] udev 181 fails to build if kernel version
	3.3 is selected
In-Reply-To: <bug-4970-163@https.bugs.busybox.net/>
References: <bug-4970-163@https.bugs.busybox.net/>
Message-ID: <20120424084131.BE12896BAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4970

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-04-24 08:41:31 UTC ---
I have taken your exact configuration, and didn't manage to reproduce the bug.
By any chance, did you make manual modifications to the uClibc configuration by
running make uclibc-menuconfig? If you've done so and disabled
UCLIBC_HAS_REALTIME, then mq_getattr would not be available in the C library,
leading to the error you got.

Can you get back to us and confirm which uClibc you had? Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
