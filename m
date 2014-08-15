From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Aug 2014 17:12:46 +0000 (UTC)
Subject: [Buildroot] [Bug 7124] Use BR toolchain externally results a
 non-bootable root filesystem
In-Reply-To: <bug-7124-163@https.bugs.busybox.net/>
References: <bug-7124-163@https.bugs.busybox.net/>
Message-ID: <20140815171246.40DAA9D0D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7124

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-08-15 17:12:45 UTC ---
I've just tested your use case, and it works fine here. Moreover, from your
description, I believe a mistake was done on your side: when you use EABIhf,
ld-linux.so.3 should *NOT* be present, and all executables should have
/lib/ld-linux-armhf.so.3 as their program interpreter (see the output of
"readelf -a").

Therefore, this makes me believe that you had some non-EABIhf binaries lying
around, and they were still referencing /lib/ld-linux.so.3, which on purpose
doesn't exist on EABIhf systems.

Consequently, I'm marking this bug as "works for me". Do not hesitate to reopen
if you disagree with this conclusion.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
