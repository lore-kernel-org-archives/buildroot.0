From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 May 2009 13:21:10 +0000 (UTC)
Subject: [Buildroot] [Bug 345] New: libcurl package needs a urandom fix
Message-ID: <bug-345-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=345

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: libcurl package needs a urandom fix
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=343)
 --> (https://bugs.busybox.net/attachment.cgi?id=343)
Fix libcurl's urandom needs

Doing a huge test-build for 2009.05-rc2 i've found that the libcurl package
only specifies the random (/dev/urandom) device to configure when building
against openssl.
But it requires this when building in general so the patch specifies the random
device always instead of conditionally, otherwise the build breaks with the
dreaded "can't determine random device when cross compiling".


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
