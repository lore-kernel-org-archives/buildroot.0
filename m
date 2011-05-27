From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 May 2011 00:34:50 +0000 (UTC)
Subject: [Buildroot] [Bug 3397] New Package: cryptsetup
In-Reply-To: <bug-3397-163@https.bugs.busybox.net/>
References: <bug-3397-163@https.bugs.busybox.net/>
Message-ID: <20110527003450.1A1A083661@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3397

--- Comment #3 from Matthew Pirretti <mpirretti@gmail.com>  ---
Shouldn't it be:
ifneq ($(BR2_PACKAGE_UDEV),y)
    CRYPTSETUP_CONF_OPT += --disable-udev
endif

instead of:
ifneq ($(BR2_PACKAGE_UDEV),y)
    CRYPTSETUP_CONF_OPT = --disable-udev
endif

Otherwise if BR2_PACKAGE_UDEV=n, then --with-libgcrypt-prefix will not be
defined and it won't build.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
