From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  9 Jun 2009 06:07:44 +0000 (UTC)
Subject: [Buildroot] [Bug 381] New: libtheora not using sdl-prefix
Message-ID: <bug-381-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=381

              Host: linux
            Target: mipsel-linux
           Summary: libtheora not using sdl-prefix
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: evan.zelkowitz at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


It seems that the libtheora build ends up linking against the local libc and/or
using the local SDL install when building along side SDL in buildroot.  I
noticed during the configure it was linking against my local SDL libraries and
using my local sdl-config.  I had to add  --with-sdl-prefix=$(STAGING_DIR)/usr
 to the libtheora.mk and then it appeared to use the correct sdl directory. 
This had caused issues for me since the rest of sdl would then attempt to use
libc.so.6 when being linked by other apps and those apps would not run on the
uclibc system since libc.so.6 did not exist.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
