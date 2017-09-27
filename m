From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Sep 2017 19:07:20 +0000
Subject: [Buildroot] [Bug 10326] mesa3d package fails to build when
 BR2_SHARED_STATIC_LIBS=y
In-Reply-To: <bug-10326-163@https.bugs.busybox.net/>
References: <bug-10326-163@https.bugs.busybox.net/>
Message-ID: <bug-10326-163-De5fKxubAy@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10326

--- Comment #5 from Arnout Vandecappelle <arnout@mind.be> ---
I agree with Frederic, there is no reason to exclude mesa3d, since it builds
fine under SHARED_STATIC with the additional --disable-static option.
SHARED_STATIC is meant for building a shared-library based rootfs and still
allowing some (custom?) packages to link statically. So if some package is
shared-only (or static-only, for that matter), it should still be possible to
build it.

Frederic, would you send your proposal as a properly formatted patch to the
mailing list?
https://buildroot.org/downloads/manual/manual.html#submitting-patches

-- 
You are receiving this mail because:
You are on the CC list for the bug.
