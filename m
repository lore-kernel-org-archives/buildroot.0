From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jul 2013 13:19:53 +0000 (UTC)
Subject: [Buildroot] [Bug 4718] python (built for powerpc) distutils has
 paths to host compiler toolchain
In-Reply-To: <bug-4718-163@https.bugs.busybox.net/>
References: <bug-4718-163@https.bugs.busybox.net/>
Message-ID: <20130710131953.30FBF9A161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4718

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #4 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-07-10 13:18:00 UTC ---
Target toolchain is deprecated so this bug is basically invalid/wontfix now.
Building modules in the target isn't supported nor encouraged.

*IF* you wanted to patch this for an older version of buildroot you'd need to
tweak $(TARGET_DIR)/usr/lib/python2.7/config/Makefile and substitute the
appropiate CC/CXX/AR/RANLIB/PYTHON_FOR_BUILD/PGEN_FOR_BUILD definitions to
those matching the target.

But it's completely unsupported, it may or may not work and might need
additional tweaking.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
