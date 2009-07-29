From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Jul 2009 19:15:37 +0000 (UTC)
Subject: [Buildroot] [Bug 497] OpenSSL RSA key generation hangs on x86_64
In-Reply-To: <bug-497-163@https.bugs.busybox.net/>
References: <bug-497-163@https.bugs.busybox.net/>
Message-ID: <20090729191537.8708E777EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=497


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-29 19:15:36 UTC ---
It's because BR2_ARCH is a string value, so it contains " chars as well, E.G.
the tests have to be written as:

ifeq ($(BR2_ARCH),"x86_64")
OPENSSL_TARGET_ARCH=x86_64
endif

I'll fix it in git - Thanks.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
