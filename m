From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Mar 2010 14:45:42 +0000 (UTC)
Subject: [Buildroot] [Bug 1453] OpenSSL0.9.8n fails to compile
In-Reply-To: <bug-1453-163@https.bugs.busybox.net/>
References: <bug-1453-163@https.bugs.busybox.net/>
Message-ID: <20100331144542.E57057FCB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1453


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2010-03-31 14:45:42 UTC ---
Strange, (In reply to comment #0)
> While building openssl with uClibc  0.9.30.3 and buildroot toolchain:
> binutils-2.20 gcc-4.3.3, build fails with error:
> 
> -D_FILE_OFFSET_BITS=64 -fomit-frame-pointer -Wall   -c -o speed.o speed.c
> speed.c:147:23: error: sys/timeb.h: No such file or directory

Strange, that should get fixed by
package/openssl/openssl-uclibc-susv3-legacy.patch - Doesn't that get applied on
your system? (check output/build/openssl-0.9.8n/.applied_patches_list)

It builds here (arm926, gcc 4.3.4, binutils 2.20.1, kernel 2.6.33.1)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
