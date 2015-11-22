From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Nov 2015 22:02:51 +0000 (UTC)
Subject: [Buildroot] [Bug 8446] rpi-userland failed to build with glibc 2.22
In-Reply-To: <bug-8446-163@https.bugs.busybox.net/>
References: <bug-8446-163@https.bugs.busybox.net/>
Message-ID: <20151122220251.82DB28005F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8446

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> 2015-11-22 22:02:49 UTC ---
Fixed in git, thanks:

commit 2a8e96d05738421898c373ffaeb61ef3ab008ef2
Author: Yann E. MORIN <yann.morin.1998@free.fr>
Date:   Sun Nov 22 15:03:34 2015 +0100

    package/rpi-userland: bump version

    Fixes build with glibc-2.22.

    Also fixes hard-to-trigger deadlock in highly threaded case, and fix
    libraries dependencies.

    Misc minor improvements in test programs as well.

    Fixes #8446.

    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Cc: gamadril.dev at gmail.com
    Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
