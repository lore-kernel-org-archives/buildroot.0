From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Feb 2011 20:43:09 +0000 (UTC)
Subject: [Buildroot] [Bug 3265] After enabling IPv6 support in the master
 configuration, uClibc has IPv6 disabled
In-Reply-To: <bug-3265-163@https.bugs.busybox.net/>
References: <bug-3265-163@https.bugs.busybox.net/>
Message-ID: <20110217204309.722D98F5B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3265

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Seems to work here:

make menuconfig,toolchain-> uClibc C library Version (daily snapshot), Enable
IPv6 support
make uclibc-menuconfig -> Networking Support
See that UCLIBC_HAS_IPV6 is enabled.

Make sure you're using the right uClibc configuration file
(toolchain/uClibc/uClibc-snapshot.config)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
