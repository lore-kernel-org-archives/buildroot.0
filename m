From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Apr 2012 21:12:02 +0000 (UTC)
Subject: [Buildroot] [Bug 4970] udev 181 fails to build if kernel version
	3.3 is selected
In-Reply-To: <bug-4970-163@https.bugs.busybox.net/>
References: <bug-4970-163@https.bugs.busybox.net/>
Message-ID: <20120427211202.F16B096BE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4970

James Le Cuirot <chewi@aura-online.co.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chewi at aura-online.co.uk

--- Comment #3 from James Le Cuirot <chewi@aura-online.co.uk> 2012-04-27 21:12:02 UTC ---
Actually I've encountered this too but building on Gentoo using Portage rather
than Buildroot. My target is i586-pc-linux-uclibc and I have definitely enabled
UCLIBC_HAS_REALTIME. I've checked and mq_getsetattr.c, where this function is
defined, definitely gets built but for some reason, the symbol is missing from
librt. I haven't yet managed to work out why.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
