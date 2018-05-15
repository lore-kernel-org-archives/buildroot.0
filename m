From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 May 2018 20:58:18 +0000
Subject: [Buildroot] [Bug 11016] Wrong compiler used for external user host
 packages
In-Reply-To: <bug-11016-163@https.bugs.busybox.net/>
References: <bug-11016-163@https.bugs.busybox.net/>
Message-ID: <bug-11016-163-HfFm3uLwzE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11016

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> ---
Buildroot does not build its own native compiler (i.e. the compiler used to
build host-packages). We don't plan to do so. It would increase the complexity
significantly.

Instead, Buildroot can exclude packages that require a recent native compiler,
using the symbols BR2_HOST_GCC_AT_LEAST_X_Y. So in your case, you could add
'depends on BR2_HOST_GCC_AT_LEAST_5' to the Config.in of
amstParseSharedLibraries. Clearly, that doesn't solve your problem because you
simply will not be able to build your packages.

However, you can fairly easily build gcc7 yourself and install it somewhere in
your PATH.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
