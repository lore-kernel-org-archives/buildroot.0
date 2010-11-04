From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Nov 2010 15:36:33 +0000 (UTC)
Subject: [Buildroot] [Bug 2767] Build for lsof broken in buildroot-2010.08
In-Reply-To: <bug-2767-163@https.bugs.busybox.net/>
References: <bug-2767-163@https.bugs.busybox.net/>
Message-ID: <20101104153633.7C0F18DAC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2767

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I've tried to build lsof today, but it fails because the FTP server rejects
anonymous logins:


--2010-11-04 16:28:39-- 
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof//lsof_4.81.tar.bz2
           => `/home/thomas/local/buildroot-dl/lsof_4.81.tar.bz2'
Resolving lsof.itap.purdue.edu... 128.210.7.20
Connecting to lsof.itap.purdue.edu|128.210.7.20|:21... connected.
Logging in as anonymous ... 
Error in server greeting.
Retrying.

Does it work for you ? If not, we should switch to using the tarball made
available by Debian, as we do for some other packages.

Moreover, I'm not terribly happy with the approach. If Buildroot passes some
CFLAGS, it's done with reason, so those CFLAGS should be taken into account,
not overriden by the package build logic. So rather than having the CFLAGS
passed on the command line ignored, I'd prefer to see them *added* to the
internal package CFLAGS.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
