From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Feb 2010 15:57:40 +0000 (UTC)
Subject: [Buildroot] [Bug 901] new package: gpsd
In-Reply-To: <bug-901-163@https.bugs.busybox.net/>
References: <bug-901-163@https.bugs.busybox.net/>
Message-ID: <20100205155740.4BFF377766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=901





--- Comment #1 from Sebastian Schuberth <sschuberth@gmail.com>  2010-02-05 15:57:38 UTC ---
Created an attachment (id=1063)
 --> (https://bugs.busybox.net/attachment.cgi?id=1063)
Adds the gpsd 2.90 package, builds libgpsmm

Here's an alternative patch based on

http://lists.uclibc.org/pipermail/buildroot/2008-August/022273.html

that I've modified to work with the most recent gpsd 2.90 release. I'm linking
against libstdc++ in order to build libgpsmm. If that's not required / desired,
simply replace the LDFLAGS stuff in GPSD_CONF_OPT with "--disable-libgpsmm",
and you will get rid of the C++ runtime dependency.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
