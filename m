From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Aug 2009 20:50:21 +0000 (UTC)
Subject: [Buildroot] [Bug 559] mesa3d build fails
In-Reply-To: <bug-559-163@https.bugs.busybox.net/>
References: <bug-559-163@https.bugs.busybox.net/>
Message-ID: <20090826205021.7282577714@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=559


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-26 20:50:20 UTC ---
(In reply to comment #0)
> Just tried to compile x11 for x86 on a x86_64 machine with
> buildroot-2009.08-rc2. I'm using an external glibc-toolchain (created by
> crosstool-ng)
> 
> Build of Mesa 7.2 fails with:
> /home/test/crosstool-ng/i686-unknown-linux-gnu/lib/gcc/i686-unknown-linux-gnu/4.3.2/../../../../i686-unknown-linux-gnu/bin/ld:
> cannot find -lX11
> collect2: ld returned 1 exit status

Hmm, could you post the entire cmdline? It sounds to me as if -sysroot is
missing, otherwise it should look in STAGING_DIR/usr/lib automatically.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
