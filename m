From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Nov 2012 14:35:00 +0000 (UTC)
Subject: [Buildroot] [Bug 5666] Fails to build python 2.7.2 for 2440 arm
In-Reply-To: <bug-5666-163@https.bugs.busybox.net/>
References: <bug-5666-163@https.bugs.busybox.net/>
Message-ID: <20121112143500.5F99099E6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5666

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-11-12 14:34:59 UTC ---
Ok. My guess is that:

*) You built once without WCHAR support in the toolchain (BR2_USE_WCHAR not
enabled)

*) You went back in menuconfig, enabled Python. But to do this, you enabled
WCHAR support in the toolchain. And then, instead of doing a complete "make
clean all" cycle that ensures the toolchain gets rebuilt, you just did "make".
So it tried to build Python without rebuilding the toolchain, leading to your
error.

I'm pretty sure that the problem will go away if you do a "make clean all"
cycle. I tested your configuration here and it built just fine.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
