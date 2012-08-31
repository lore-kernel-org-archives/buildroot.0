From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Aug 2012 00:08:05 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] libglib2 build fails on qsort r test
In-Reply-To: <bug-5486-163@https.bugs.busybox.net/>
References: <bug-5486-163@https.bugs.busybox.net/>
Message-ID: <20120831000805.3DFD4994DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

--- Comment #1 from twobob <seetwobob@live.co.uk> 2012-08-31 00:08:04 UTC ---
(In reply to comment #0)
> Using CS TC (current or otherwise), 32 bit system. Builroot latest via GIT
> 
> libglib2-2.30.2
> 
> As a general overview:
> CFLAGS="-fno-stack-protector -O2 -ffast-math -march=armv6j -mtune=arm1136jf-s
> -mfpu=vfp -pipe -$fomit-frame-pointer"
> CXXFLAGS="-fno-stack-protector" CPPFLAGS="-U_FORTIFY_SOURCE" 
> HOST=i686-pc-linux
> BUILD=arm-unknown-linux-gnueabi
> 
> Whilst:
> >>> libglib2 2.30.2 Building
> Fails with
>   CC     gtester.o
>   CCLD   libglib-2.0.la
>   CCLD   gtester
> ./.libs/libglib-2.0.so: undefined reference to `qsort_r'
> collect2: ld returned 1 exit status
> 
> There was some reference (related? maybe?) to an embedded patch for libglib2 re
> another system here: http://patches.openembedded.org/patch/14169/ 
> Perhaps it is relevant.
> 
> This is my first bug report apologies for any elided required info.
> Will be glad to forward any extra required.
> 
> Regards.


Just wanted to add that the link doesn't actually point to the fix/patch
itself. it's a monologue about when it should be used. and a patch for when it
would be applied in the other system. Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
