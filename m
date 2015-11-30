From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Nov 2015 07:24:17 +0000 (UTC)
Subject: [Buildroot] [Bug 8491] libglib2 2.46.1 not Building for armv5 on
	2015.11-rc3
In-Reply-To: <bug-8491-163@https.bugs.busybox.net/>
References: <bug-8491-163@https.bugs.busybox.net/>
Message-ID: <20151130072417.7EF1081E98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8491

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> 2015-11-30 07:24:17 UTC ---
Fixed in git by:

commit 26013972ce568e55a121c21a55afce45bc0675e9
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Mon Nov 30 08:19:59 2015 +0100

    libglib2: force arm mode when building with thumb1

    Fixes #8491

    glib/valgrind.h contains inline asm not compatible with thumb1, so build it
    in arm mode:

      CC       libglib_2_0_la-gstringchunk.lo
    /tmp/ccSVEXME.s: Assembler messages:
    /tmp/ccSVEXME.s:587: Error: shifts in CMP/MOV instructions are only
supported
    in unified syntax -- `mov r12,r12,ror#3'
    /tmp/ccSVEXME.s:587: Error: shifts in CMP/MOV instructions are only
supported
    in unified syntax -- `mov r12,r12,ror#13'
    /tmp/ccSVEXME.s:588: Error: shifts in CMP/MOV instructions are only
supported
    in unified syntax -- `mov r12,r12,ror#29'
    /tmp/ccSVEXME.s:588: Error: shifts in CMP/MOV instructions are only
supported
    in unified syntax -- `mov r12,r12,ror#19'
    /tmp/ccSVEXME.s:589: Error: lo register required -- `orr r10,r10,r10'
    Makefile:2087: recipe for target 'libglib_2_0_la-gslice.lo' failed

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
