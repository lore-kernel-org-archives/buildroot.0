From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Nov 2009 21:34:08 +0000 (UTC)
Subject: [Buildroot] [Bug 751] New: Kernel 2.6 snapshot fetch fail
Message-ID: <bug-751-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=751

              Host: i686
            Target: arm
           Summary: Kernel 2.6 snapshot fetch fail
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: FIXME
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: xor.gate.engineering at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Dear Developers,
There is a bug while fetch snapshot kernel(headers). The correct string is not
appended to the tar.bz2 filename. See below for the verbose output of the
error.
This happens with Buildroot 2009.11-rc2.

Kind Regards,
Jerry Jacobs


----- SNIPPED PREVIOUS VERBOSE OUTPUT
/home/jerry/embedded/buildroot/buildroot-2009.11-rc2/output/build/buildroot-config
mkdir -p /home/jerry/embedded/buildroot/buildroot-2009.11-rc2/output/build
cp -dpRf package/config/buildroot-config
/home/jerry/embedded/buildroot/buildroot-2009.11-rc2/output/build/buildroot-config
--2009-11-30 22:16:01--
http://www.kernel.org/pub//linux/kernel/v2.6//linux-2.6..tar.bz2
Resolving www.kernel.org... 199.6.1.164
Connecting to www.kernel.org|199.6.1.164|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2009-11-30 22:16:01 ERROR 404: Not Found.

--2009-11-30 22:16:01--
http://buildroot.net/downloads/sources//linux-2.6..tar.bz2
Resolving buildroot.net... 140.211.167.224
Connecting to buildroot.net|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2009-11-30 22:16:02 ERROR 404: Not Found.

make: *** [dl/linux-2.6..tar.bz2] Error 1


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
