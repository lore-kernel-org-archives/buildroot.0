From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Nov 2015 19:53:33 +0000 (UTC)
Subject: [Buildroot] [Bug 8441] New: Invalid directory for X11 fonts in
	target (RPi2)
Message-ID: <bug-8441-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8441

           Summary: Invalid directory for X11 fonts in target (RPi2)
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: buildroot at netsolux.ch
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

In the target directory, all X11 fonts are installed in wrong directory :

[root at devel target]$ pwd
/data/buildroot/output/target

[root at devel target]$ find . -name fonts -print
./usr/share/fonts
./etc/fonts
./data/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/share/fonts

[root at devel target]$ ls -lsa
./data/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/share/fonts
total 12
4 drwxr-xr-x 3 root root 4096 Nov  5 19:22 .
4 drwxr-xr-x 4 root root 4096 Nov  5 19:22 ..
4 drwxr-xr-x 7 root root 4096 Nov  5 19:29 X11

[root at devel target]$ ls -lsa
./data/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/share/fonts/X11/
total 44
 4 drwxr-xr-x 7 root root  4096 Nov  5 19:29 .
 4 drwxr-xr-x 3 root root  4096 Nov  5 19:22 ..
 4 drwxr-xr-x 2 root root  4096 Nov  5 19:29 100dpi
 4 drwxr-xr-x 2 root root  4096 Nov  5 19:29 75dpi
 4 drwxr-xr-x 2 root root  4096 Nov  5 19:29 cyrillic
 4 drwxr-xr-x 3 root root  4096 Nov  5 19:22 encodings
20 drwxr-xr-x 2 root root 20480 Nov  5 19:29 misc

[root at devel target]$ ls -lsa ./usr/share/fonts
total 12
4 drwxr-xr-x  3 root root 4096 Nov  5 18:47 .
4 drwxr-xr-x 23 root root 4096 Nov  5 20:11 ..
4 drwxr-xr-x  2 root root 4096 Nov  5 18:47 dejavu

Best Regards,

Thomas

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
