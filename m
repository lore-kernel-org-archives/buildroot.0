From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Feb 2009 17:38:55 +0000 (UTC)
Subject: [Buildroot] [Bug 81] New: New package wpa_supplicant
Message-ID: <bug-81-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=81

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: New package wpa_supplicant
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=47)
 --> (https://bugs.busybox.net/attachment.cgi?id=47)
New wpa_supplicant package take 1

While working on my own stuff i found there was no wpa_supplicant package.
This patch adds the wpa_supplicant package (latest stable version - 0.5.11).
I'm calling it "take 1" since EAP is included by default, though making it an
option would make for a messy config & mk file since there are lots of options
in there. Also there's no possibility to enable/disable drivers, the default
ones are enabled (wired, wext, hostap & atmel). Someone may be interested in
enabling one of the others - i have no way of testing them.
Installing the different binaries is optional for wpa_cli and wpa_passphrase,
obviously wpa_supplicant is always installed otherwise there would be no point
in this ;-)
And the TLS implementation can be openssl (smaller binary but requires openssl,
if it's already included it's a win) or internal (bigger binary, not so well
tested, doesn't need openssl though so it may be a size win in some scenarios).
Tested with linux wext driver with a zd1211rw on arm.
Enjoy.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
