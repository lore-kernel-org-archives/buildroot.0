From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 14:25:53 +0000 (UTC)
Subject: [Buildroot] [Bug 5234] kexec fails to build
In-Reply-To: <bug-5234-163@https.bugs.busybox.net/>
References: <bug-5234-163@https.bugs.busybox.net/>
Message-ID: <20130526142553.335399A2C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5234

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 14:24:44 UTC ---
I've just tested with the latest Buildroot, and bin-to-hex is properly built
with the host compiler and later used without problem.

...
cc   -O2 -Wall -o bin/bin-to-hex util/bin-to-hex.c
...
bin/bin-to-hex purgatory < purgatory/purgatory.ro > kexec/purgatory.c
...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
