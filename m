From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 Dec 2012 18:22:12 +0000 (UTC)
Subject: [Buildroot] [Bug 5810] Buildroot 2012.11: Additional GCC option
 "-msoft-float" breaks the build
In-Reply-To: <bug-5810-163@https.bugs.busybox.net/>
References: <bug-5810-163@https.bugs.busybox.net/>
Message-ID: <20121221182212.56F119A403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5810

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-12-21 18:22:34 UTC ---
Please post your Buildroot .config so we can reproduce the problem.

And for the "meanwhile - why it applies arm related patches to x86?" question,
this is because we don't do architecture-specific patches. Those patches are
always applied, regardless of which architecture you are building for, but in
practice they only touch ARM-specific parts of gcc, so they are totally
harmless if you build for x86, PowerPC or MIPS. Having a single stack of
patches that are always applied regardless of the selected architecture is much
better than having per-architecture patches.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
