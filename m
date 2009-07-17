From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jul 2009 09:19:20 +0000 (UTC)
Subject: [Buildroot] [Bug 271] Library 'libgcc_s.so.1' not installed in
	search path
In-Reply-To: <bug-271-163@https.bugs.busybox.net/>
References: <bug-271-163@https.bugs.busybox.net/>
Message-ID: <20090717091920.B732B77761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=271


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-07-17 09:19:20 UTC ---
Quite probably fixed by

commit 90c5d156f5414225be756a3e3bff7bb4b532bdf4
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Thu Jul 2 09:38:56 2009 +0200

    toolchain/gcc: ensure libraries are copied to target_dir for x86-64

    x86-64 stores libgcc_s / libstdc++ / libgcj under lib64 instead of lib,
    so make sure that directory is searched as well for libraries to copy
    to target.

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
