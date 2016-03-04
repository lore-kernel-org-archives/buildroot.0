From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Mar 2016 16:10:53 +0000
Subject: [Buildroot] [Bug 8736] IPV6 forced on in busybox
In-Reply-To: <bug-8736-163@https.bugs.busybox.net/>
References: <bug-8736-163@https.bugs.busybox.net/>
Message-ID: <bug-8736-163-AEGNMiPg3n@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8736

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #10 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git by:

commit 7a5be2a042f3c1d55c5599ad819333a2150955ff
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Fri Mar 4 16:47:38 2016 +0100

    busybox: tweak IPv6/largefile handling

    Fixes #8736

    When IPv6 and largefile options were removed from Buildroot, the code to
    force these options in busybox were still left in.

    There's no strong reason to forcefully enable these options (only to
disable
    options if the system cannot support it like we do for nommu), so instead
    enable the options in our default defconfig, allowing people to override
    this if they use a custom config.

    While we're at it, enable the prefer-ipv4 option so network applets like
    ntpd doesn't fail when dual stacked hosts are resolved from a system
without
    IPv6 support enabled in the kernel.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
