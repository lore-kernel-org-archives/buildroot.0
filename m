From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Oct 2012 12:32:26 +0000 (UTC)
Subject: [Buildroot] [Bug 5624] When building directfb,
 BR2_TARGET_LDFLAGS not used by libtool
In-Reply-To: <bug-5624-163@https.bugs.busybox.net/>
References: <bug-5624-163@https.bugs.busybox.net/>
Message-ID: <20121024123226.24095998BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5624

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-10-24 12:32:25 UTC ---
The first problem is that DirectFB is stupid in its usage of ld. It should
always use gcc, even for pure linking steps, as gcc will pass the appropriate
arguments to ld.

The second problem is that we don't generate a toolchain wrapper for ld, so yes
the BR2_TARGET_LDFLAGS are not passed.

I am not sure if we should fix DirectFB, or add the toolchain wrapper for ld.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
