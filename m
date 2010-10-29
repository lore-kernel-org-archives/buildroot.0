From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 Oct 2010 18:16:11 +0000 (UTC)
Subject: [Buildroot] [Bug 2743] buildroot-2010.08 forgets to include /lib/*
 into rootfs.ext2
In-Reply-To: <bug-2743-163@https.bugs.busybox.net/>
References: <bug-2743-163@https.bugs.busybox.net/>
Message-ID: <20101029181611.BB93C8D43E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2743

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
bugzilla> my #-stripped .config:
bugzilla> BR2_PREFER_STATIC_LIB=y

You've selected static linking, so you shouldn't need any libs. This is
not a commonly used configuration though so it might be broken (actually
it most likely is). Disable that option and rm -rf output; make

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
