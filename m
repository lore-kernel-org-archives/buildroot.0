From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 15:09:25 +0000 (UTC)
Subject: [Buildroot] [Bug 5252] udev 182 build failed 2012.05
In-Reply-To: <bug-5252-163@https.bugs.busybox.net/>
References: <bug-5252-163@https.bugs.busybox.net/>
Message-ID: <20130526150925.ECAAC9A2A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5252

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 15:08:16 UTC ---
I'm not able to reproduce here with the latest Buildroot.

The build failure is apparently due to blkid_probe not being defined in
<blkid/blkid.h>, which is installed by util-linux. util-linux has been updated
in Buildroot to 2.22.2 in the mean time, maybe it's what caused the problem to
disappear.

I'll mark the bug as fixed. If it still doesn't work for you with the last
Buildroot release, do not hesitate to reopen the bug and provide more details
(Buildroot .config especially).

Also, beware that building from a directory in /usr is not supported.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
