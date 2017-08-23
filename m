From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Aug 2017 08:22:15 +0000
Subject: [Buildroot] [Bug 10246] BR2_ENABLE_DEBUG does not have the expected
 effect for cmake packages
In-Reply-To: <bug-10246-163@https.bugs.busybox.net/>
References: <bug-10246-163@https.bugs.busybox.net/>
Message-ID: <bug-10246-163-A9o9XYZN2n@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10246

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
What you're proposing is to exactly revert
https://git.buildroot.org/buildroot/commit/package/pkg-cmake.mk?id=104bb29e0490bfb487e2e665448dd3ca07fcc2b5,
which already reverted the change you're proposing :)

So, see the commit log of
https://git.buildroot.org/buildroot/commit/package/pkg-cmake.mk?id=104bb29e0490bfb487e2e665448dd3ca07fcc2b5
for the explanation of why we're using the Debug build type and not the
RelWithDebInfo build type.

If you disagree, please submit a patch to the mailing list with a precise
description of why reverting
https://git.buildroot.org/buildroot/commit/package/pkg-cmake.mk?id=104bb29e0490bfb487e2e665448dd3ca07fcc2b5
is a good idea. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
