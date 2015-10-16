From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Oct 2015 09:46:18 +0000 (UTC)
Subject: [Buildroot] [Bug 8116] 2015.05-rc2 raspberrypi2_defconfig network
 interface not coming up
In-Reply-To: <bug-8116-163@https.bugs.busybox.net/>
References: <bug-8116-163@https.bugs.busybox.net/>
Message-ID: <20151016094618.2ED8681F94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8116

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org> 2015-10-16 09:46:17 UTC ---
Fixed in git by:

commit 49964858f45d2243c513e6d362e992ad89ec7a45
Author: Yann E. MORIN <yann.morin.1998@free.fr>
Date:   Sat Oct 3 14:31:45 2015 +0100

    package/initscripts: S40network: wait for network interfaces to appear

    On some machines, the network interface is slow to appear. For example,
    on the Raspberry Pi, the network interface eth0 is an ethernet-over-USB,
    and our standard boot process is too fast, so our network startup script
    is called before the USB bus is compeltely enumerated, thus it can't
    configure eth0.

    Closes #8116.

    [Peter: move to S40network, handle multiple interfaces]
    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
