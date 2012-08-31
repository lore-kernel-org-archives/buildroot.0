From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Aug 2012 14:41:40 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] libglib2 build fails on qsort r test
In-Reply-To: <bug-5486-163@https.bugs.busybox.net/>
References: <bug-5486-163@https.bugs.busybox.net/>
Message-ID: <20120831144140.E8B3D99394@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

--- Comment #6 from Sven Neumann <s.neumann@raumfeld.com> 2012-08-31 14:41:40 UTC ---
Well, yes, the fix that Peter committed specifically addresses the uCLibC case.
If your external toolchain doesn't provide qsort_r, then your build will still
fail.

I am not sure if this can be fixed properly in buildroot as we can't know all
details about any possible external toolchain. But you can work around this by
adding "glib_cv_have_qsort_r=no" to LIBGLIB2_CONF_ENV in your tree.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
