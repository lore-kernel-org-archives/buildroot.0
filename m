From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Mar 2011 12:16:13 +0000 (UTC)
Subject: [Buildroot] [Bug 3511] New: make busybox-menuconfig does not
 download busybox package
Message-ID: <bug-3511-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3511

           Summary: make busybox-menuconfig does not download busybox
                    package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dmitry at radiofid.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


'make busybox-menuconfig' does not download busybox package, while 'make
linux26-menuconfig' and 'make uclibc-menuconfig' do. Workaround is to call
'make busybox' (which fails since no crosscompiler is available yet) and repeat
'make busybox-menuconfig'.

$ make busybox-menuconfig
>>> busybox 1.18.4 Extracting
bzcat: Can't open input file
/home/dimka/buildroot/router-irz-wimax-fw/dl/busybox-1.18.4.tar.bz2: No such
file or directory.
tar: ??? ?? ?????? ?? tar-?????
tar: ?????????? ?????? ? ?????????? ????????????? ? ??-?? ????????? ??????
make: ***
[/home/dimka/buildroot/router-irz-wimax-fw/output/build/busybox-1.18.4/.stamp_extracted]
?????? 2

(Sorry for russian text)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
