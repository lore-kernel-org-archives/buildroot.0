From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Aug 2009 21:21:51 +0000 (UTC)
Subject: [Buildroot] [Bug 575] Buildroot Libtool Patch Fails
In-Reply-To: <bug-575-163@https.bugs.busybox.net/>
References: <bug-575-163@https.bugs.busybox.net/>
Message-ID: <20090819212151.59E27772E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=575





--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-08-19 21:21:50 UTC ---
Webkit uses libtool 2.x, while Buildroot patch for libtool only applies to
1.5.x versions of libtool. Therefore, Webkit Makefile should set
WEBKIT_LIBTOOL_PATCH=NO. However, even with this fix, I have libtool issues
while compiling Webkit, which is why I haven't submitted the fix yet.

But since you're compiling for a x86 target on a x86 host, setting
WEBKIT_LIBTOOL_PATCH = NO might be enough for you.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
