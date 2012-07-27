From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Jul 2012 15:30:16 +0000 (UTC)
Subject: [Buildroot] [Bug 5408] qt build failure with Sourcery CodeBench ARM
	2010.09
In-Reply-To: <bug-5408-163@https.bugs.busybox.net/>
References: <bug-5408-163@https.bugs.busybox.net/>
Message-ID: <20120727153016.8EDF496F39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5408

Luca Ceresoli <luca.ceresoli@tiscali.it> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |luca.ceresoli at tiscali.it

--- Comment #1 from Luca Ceresoli <luca.ceresoli@tiscali.it> 2012-07-27 15:30:15 UTC ---
This is a gcc 4.5 bug, as discussed in great detail at
https://bugs.launchpad.net/gcc-linaro/+bug/675347 and it affects Sourcery
2010.09 too.

The bug has been fixed in later gcc (and thus Sourcery) releases, but there is
a workaround in comment 23 in the launchpad bug page above.
Just adding -fno-strict-volatile-bitfields to the compilation options makes Qt
build and run. Note that this flag needs to be added to Qt *and* all programs
using it, since the line triggering the error is in an include file.

Should I submit a patch so that BR2_TARGET_OPTIMIZATION defaults to a value
with this flag when Sourcery 2010.09 is in use? Or just document it in
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
