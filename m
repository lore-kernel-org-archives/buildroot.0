From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Nov 2015 22:30:09 +0000 (UTC)
Subject: [Buildroot] [Bug 8496] Toolchain -> Target Optimizations ignored &
	not applied.
In-Reply-To: <bug-8496-163@https.bugs.busybox.net/>
References: <bug-8496-163@https.bugs.busybox.net/>
Message-ID: <20151130223009.B41F481E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8496

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> 2015-11-30 22:30:09 UTC ---
In 2015.11-rcX, you no longer see the "Target Optimizations" in the
TARGET_CFLAGS because they are handled by the toolchain wrapper. To see exactly
which options are passed to gcc, set BR2_DEBUG_WRAPPER=1 in the environment.

If you still believe this is not working, please provide:
- the buildroot version you are using;
- a small defconfig that exposes the problem;
- some proof that the flags really are not passed to gcc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
