From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Nov 2013 18:30:42 +0000 (UTC)
Subject: [Buildroot] [Bug 1279] Buildroot compiled Busybox and Coreutils LFS
	issues
In-Reply-To: <bug-1279-163@https.bugs.busybox.net/>
References: <bug-1279-163@https.bugs.busybox.net/>
Message-ID: <20131128183042.7754C9BE2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1279

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #7 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-11-28 18:30:42 UTC ---
Working just fine with qemu_x86_defconfig + LARGEFILE + cifs-utils + strace
(and tweaked kernel with CONFIG_CIFS=m against a 2 TB share).
Strace shows busybox ls using *stat64 all along.
Didn't try coreutils ls but i guess this was fixed along some time ago because
of the bug age.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
