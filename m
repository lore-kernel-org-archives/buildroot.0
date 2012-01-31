From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jan 2012 19:46:56 +0000 (UTC)
Subject: [Buildroot] [Bug 4634] Bigendian binary is output even if it is
 configured to output little endian
In-Reply-To: <bug-4634-163@https.bugs.busybox.net/>
References: <bug-4634-163@https.bugs.busybox.net/>
Message-ID: <20120131194656.C778A90962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4634

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-01-31 19:46:56 UTC ---
Buildroot does not automatically add the needed CFLAGS and LDFLAGS to use the
adequate multilib variant, because those CFLAGS and LDFLAGS are very
toolchain-specific and architecture-specific. So it is the user's job to add
explictly those flags.

I have posted a patch,
http://lists.busybox.net/pipermail/buildroot/2012-January/049556.html, which
adds some help text on the different external toolchains about their respective
multilib variants and how to select between them. Hopefully, this patch should
be merged for 2012.02.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
