From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Oct 2014 21:01:15 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] Multiple chosen python modules are not built
 due to missing header files in include path
In-Reply-To: <bug-7478-163@https.bugs.busybox.net/>
References: <bug-7478-163@https.bugs.busybox.net/>
Message-ID: <20141026210115.0C9A7ADAB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

--- Comment #11 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-10-26 21:01:14 UTC ---
(In reply to comment #9)
> From that point, I'm a bit clueless why the sysroot include dir isn't in the
> dir list when an internal toolchain is used. Where is the next place to look ?
> Maybe something with the python configure options ?

There is no need for the sysroot include dir to be explicitly passed to gcc
with the internal toolchain, because the Buildroot sysroot is configured to be
the natural location for the compiler to look for headers.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
