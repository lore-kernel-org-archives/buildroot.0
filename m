From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Apr 2012 22:03:41 +0000 (UTC)
Subject: [Buildroot] [Bug 5006] make performs library lookup in the build
 and host library directores and not in the staging area
In-Reply-To: <bug-5006-163@https.bugs.busybox.net/>
References: <bug-5006-163@https.bugs.busybox.net/>
Message-ID: <20120417220341.B968296AFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5006

--- Comment #5 from Arnout Vandecappelle <arnout@mind.be> 2012-04-17 22:03:41 UTC ---
My bad, I was confused by the CC=gcc line.

A Makefile that uses a -lfoo dependency for something it can't rebuild is
pretty silly, I think.  As a workaround, though, you could pass
VPATH="$(STAGING_DIR)/lib:$(STAGING_DIR)/usr/lib" - hopefully that Makefile
doesn't use VPATH itself.

BTW it's definitely worthwhile to upstream a patch that gets the libdirs from a
variable similar to .LIBPATTERNS.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
