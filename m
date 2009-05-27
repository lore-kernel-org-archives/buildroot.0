From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 May 2009 18:23:48 +0000 (UTC)
Subject: [Buildroot] [Bug 345] libcurl package needs a urandom fix
In-Reply-To: <bug-345-163@https.bugs.busybox.net/>
References: <bug-345-163@https.bugs.busybox.net/>
Message-ID: <20090527182348.9FF427786B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=345


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org>  2009-05-27 18:23:47 UTC ---
Seems like bugzilla threw away my previous comment :/

Anyway, the real problem is way the X packages are structured. It should be
possible to compile X applications without having an X server on the target
(and just xlib), but that's currently not the case. The problem you ran into is
that packages depend on !BR_PACKAGE_XSERVER_none in kconfig, but use $(XSERVER)
as the make dependency, and you can enable BR2_PACKAGE_XSERVER_{tinyx,xorg}
without enabling an Xserver.

I'll work on cleaning this up post-2009.05 release, but for now I simply fixed
libcurl to not look for openssl if it's not enabled in kconfig.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
