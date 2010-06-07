From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 20:40:37 +0000 (UTC)
Subject: [Buildroot] [Bug 475] uImage target for U-boot failed generating
In-Reply-To: <bug-475-163@https.bugs.busybox.net/>
References: <bug-475-163@https.bugs.busybox.net/>
Message-ID: <20100607204037.3973A8F4D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=475

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|enhancement                 |normal

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Yes, the BR2_KERNEL_LINUX infrastructure doesn't handle the dependency on
mkimage, while the BR2_KERNEL_LINUX_ADVANCED infrastructure does. I don't
intend to fix the current BR2_KERNEL_LINUX infrastructure since I've completely
rewritten the code to compile the Linux kernel and hope to get it merged for
2010.08. The dependency on mkimage in this new infrastructure should be
correct.

So if my new infrastructure gets merged, we'll be able to mark this bug as
fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
