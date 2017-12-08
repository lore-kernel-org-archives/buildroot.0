From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 Dec 2017 18:19:22 +0000
Subject: [Buildroot] [Bug 10561] OpenZwave generates libopenzwave.so.1.4
 instead of libopenzwave.so.1.5
In-Reply-To: <bug-10561-163@https.bugs.busybox.net/>
References: <bug-10561-163@https.bugs.busybox.net/>
Message-ID: <bug-10561-163-nAn2dL6Jgx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10561

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
This isn't a problem. The soname does not _NEED_ to match the package version,
and the openzwave upstream has decided (explictly or by accident) to not bump
the soname version when releasing version 1.5.

See cpp/build/support.mk in the openzwave sources for details.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
