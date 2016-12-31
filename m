From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 08:15:24 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-h2QjzeZZnn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #20 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to bilge from comment #19)

I think we are talking past eachother. Dependencies for on the target (E.G. the
thing that will finally do something with the rootfs) are all runtime
dependencies, so the build order doesn't matter.

So yeah, you simply need to enable busybox as well to make sure /usr/bin/env is
also available in the rootfs when the target needs it at runtime. You can tweak
the busybox config if you want to save some space, but you need to be careful
to not remove stuff that is needed elsewhere (E.G. env)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
