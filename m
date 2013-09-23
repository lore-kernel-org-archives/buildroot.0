From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Sep 2013 10:06:41 +0000 (UTC)
Subject: [Buildroot] [Bug 1153] Buildroot fails to build packages if
 BR2_GCC_SHARED_LIBGCC=y
In-Reply-To: <bug-1153-163@https.bugs.busybox.net/>
References: <bug-1153-163@https.bugs.busybox.net/>
Message-ID: <20130923100641.6B3409B848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1153

--- Comment #3 from busybox at crayor.com 2013-09-23 10:07:03 UTC ---
I just want to let everybody know what might be the source of this problem.

undefined hidden symbol in libgcc.a(xxxxxxx.o)  '__xxxxx()' referenced by DSO.

These kind of errors are usually due to libgcc.a not being linked into a
library. So when creating a library that process went wrong.
If you delete the specific library so that Buildroot (usually) re-creates them,
you have a good chance that the build will succeed.

These undefined hidden symbol errors happen to me in Buildroot 2009.11 when I
build the util-linux package until I delete statging/usr/lib/libncurses.so.5.6
before building.

I know this does not exactly track down the problem but might still be an
important info of what to look for.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
