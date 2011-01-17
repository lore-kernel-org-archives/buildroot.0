From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jan 2011 12:00:17 +0000 (UTC)
Subject: [Buildroot] [Bug 3103] New: make external-deps wants to download
 gcc-.tar.bz2 when using an external toolchain
Message-ID: <bug-3103-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3103

           Summary: make external-deps wants to download gcc-.tar.bz2 when
                    using an external toolchain
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: eliedebrauwer at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2863
  --> https://bugs.busybox.net/attachment.cgi?id=2863
.config illustrating this problem.

I tested this on 2010.11 and buildroot-20110117.tar.bz2, I tested this with a
real external toolchain/powerpc but for the sake of the exercise let's do this
as follows. Steps to reproduce:
   * Extract buildroot
   * make allnoconfig
   * In make menuconfig -> toolchain -> set toolchain type to external
toolchain, save the config


edb at lapedb:/tmp/tmp/buildroot$ make external-deps
gcc-.tar.bz2
gmp-5.0.1.tar.bz2
mpfr-3.0.0.tar.bz2
edb at lapedb:/tmp/tmp/buildroot$ make source
<snip>
successful download of http://ftp.gnu.org/pub/gnu/gmp/gmp-5.0.1.tar.bz2 and
http://www.mpfr.org/mpfr-3.0.0/mpfr-3.0.0.tar.bz2 </snip>

mkdir -p /tmp/tmp/buildroot/dl
--2011-01-17 12:58:19--  http://ftp.gnu.org/pub/gnu/gcc/gcc-/gcc-.tar.bz2
Resolving ftp.gnu.org... 140.186.70.20
Connecting to ftp.gnu.org|140.186.70.20|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2011-01-17 12:58:20 ERROR 404: Not Found.

--2011-01-17 12:58:20--  http://sources.buildroot.net//gcc-.tar.bz2
Resolving sources.buildroot.net... 88.198.64.109
Connecting to sources.buildroot.net|88.198.64.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2011-01-17 12:58:20 ERROR 404: Not Found.

make: *** [/tmp/tmp/buildroot/dl/gcc-.tar.bz2] Error 1


Adding my .config in attach

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
