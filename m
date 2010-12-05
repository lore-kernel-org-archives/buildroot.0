From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Dec 2010 14:38:20 +0000 (UTC)
Subject: [Buildroot] [Bug 2893] New: Broken "make source" with external
	toolchain
Message-ID: <bug-2893-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2893

           Summary: Broken "make source" with external toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: serj.kalichev at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Buildroot version: 2010.11

Broken "make source" with external toolchain.
How to reproduce:

Untar the buildroot archive.
$make menuconfig
Don't change any defaults. Set external toolchain (I use buildroot toolchain).
$make source

Output:
/bin/sh:
/home/pkun/work/buildroot-2010.11/../installernx_toolchain/output/staging/usr/bin/i386-linux-gcc:
No such file or directory
readlink: missing operand
Try `readlink --help' for more information.
mkdir -p /home/pkun/work/buildroot-2010.11/dl
--2010-12-05 17:35:42--  http://ftp.gnu.org/pub/gnu/gcc/gcc-/gcc-.tar.bz2
Resolving ftp.gnu.org... 140.186.70.20
Connecting to ftp.gnu.org|140.186.70.20|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-12-05 17:35:43 ERROR 404: Not Found.

--2010-12-05 17:35:43--  http://sources.buildroot.net//gcc-.tar.bz2
Resolving sources.buildroot.net... 88.198.64.109
Connecting to sources.buildroot.net|88.198.64.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-12-05 17:35:43 ERROR 404: Not Found.

make: *** [/home/pkun/work/buildroot-2010.11/dl/gcc-.tar.bz2] Error 1


Probably the gcc download is unconditional.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
