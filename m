From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Mar 2014 20:35:11 +0000 (UTC)
Subject: [Buildroot] [Bug 6986] Make legal-info fails on uboot versions
	before 2014.01
In-Reply-To: <bug-6986-163@https.bugs.busybox.net/>
References: <bug-6986-163@https.bugs.busybox.net/>
Message-ID: <20140324203511.AA1FC9C0FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6986

--- Comment #2 from Matthew Starr <mstarr@hedonline.com> 2014-03-24 20:35:11 UTC ---
(In reply to comment #1)
> Hi,
> 
> It would indeed be nice to handle this more gracefully, but that's
> unfortunately not currently possible with the legal-info infrastructure.
> 
> The fact that it fails when the license file isn't available is quite nice for
> testing, as the autobuilders very soon informs us of the failure (mistyped
> license file, a package with a license change in a new version), but for the
> end user a warning would be nicer.

Could the boot/uboot/uboot.mk file be updated to look for the existence of the
Licenses/gpl-2.0.txt file and if it doesn't exist look for the COPYING file? 
If the COPYING file is also not present then fail.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
