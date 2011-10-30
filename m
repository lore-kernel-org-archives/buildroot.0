From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 30 Oct 2011 20:27:21 +0000 (UTC)
Subject: [Buildroot] [Bug 4399] Unable to use Ubuntu 11.10 arm cross compiler
In-Reply-To: <bug-4399-163@https.bugs.busybox.net/>
References: <bug-4399-163@https.bugs.busybox.net/>
Message-ID: <20111030202721.F17EA8F3AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4399

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2011-10-30 20:27:21 UTC ---
I had the same problem trying to use the Ubuntu ARM cross-compiler.
Unfortunately, while it allows to go a bit further, it doesn't fix the fact
that the Ubuntu ARM cross-compiler is not a *pure* toolchain: it contains many
more libraries and utilities compiled for the target than a normal toolchain,
and this doesn't play well with build systems, including Buildroot.

For that reason, we do not support building with the Ubuntu ARM cross-compiler
at the moment. Either build your toolchain with Buildroot or Crosstool-NG, or
get a pre-compiled one from CodeSourcery (which offers pure toolchains).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
