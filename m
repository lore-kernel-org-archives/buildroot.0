From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Nov 2015 23:01:28 +0000 (UTC)
Subject: [Buildroot] [Bug 8496] Toolchain -> Target Optimizations ignored &
	not applied.
In-Reply-To: <bug-8496-163@https.bugs.busybox.net/>
References: <bug-8496-163@https.bugs.busybox.net/>
Message-ID: <20151129230128.B06B38177F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8496

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-11-29 23:01:28 UTC ---
An option like -mtune should *not* be passed in "Target optimization". The
march, mcpu and mtune options are all defined automatically depending on the
value you specify in the "Target options" menu, where you select the
architecture and architecture variant. Select xscale there and you're all set.

Also, the reason why you don't see -mcpu, -mtune and so on is because they are
automatically passed by our toolchain wrapper, so they are hidden. Or if you
are using an internal toolchain, then the toolchain is configured to build
binaries for the specified target, so there is no need to pass mcpu/mtune/march
when invoking the compiler.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
