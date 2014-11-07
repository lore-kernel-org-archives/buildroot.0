From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Nov 2014 07:37:03 +0000 (UTC)
Subject: [Buildroot] [Bug 7562] musl buildroot-toolchain and
	BR2_MIPS_SOFT_FLOAT break
In-Reply-To: <bug-7562-163@https.bugs.busybox.net/>
References: <bug-7562-163@https.bugs.busybox.net/>
Message-ID: <20141107073703.EA455A45E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7562

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-07 07:37:03 UTC ---
Thanks for the report. That's due to a lack of coherency between the musl
installation code (which indeed installs the ld-musl-mipsel-sf symbolic link)
and the gcc patch we have for musl support, which assumes the mips dynamic
linker is always ld-musl-mipsel, regarding of whether it's hard-float or
soft-float.

I'll have a look into this and if applicable report this up to the folks doing
the gcc patches for musl.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
