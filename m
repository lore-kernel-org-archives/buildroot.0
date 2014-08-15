From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Aug 2014 10:35:55 +0000 (UTC)
Subject: [Buildroot] [Bug 7322] libgomp dependency issue with imagemagick
In-Reply-To: <bug-7322-163@https.bugs.busybox.net/>
References: <bug-7322-163@https.bugs.busybox.net/>
Message-ID: <20140815103555.9AF9A9D45F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7322

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-08-15 10:35:54 UTC ---
Thanks for your clear bug report.
How 'standard' is libgomp in external toolchains? Is it something that is
present in a typical toolchain, or does it have to be enabled explicitly?

How large is this library (stripped)?

We could simply copy libgomp* to the target when present, regardless of any
package dependency like imagemagick.
In toolchain/toolchain-external/toolchain-external.mk, we would have to extend
the LIB_EXTERNAL_LIBS variable with libgomp.

If either the presence of libgomp is not standard, or it is sufficiently small,
then this would be a fine strategy I believe...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
