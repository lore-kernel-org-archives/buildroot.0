From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Jun 2010 15:22:59 +0000 (UTC)
Subject: [Buildroot] [Bug 2119] New: Tries to build kernel,
	although disabled in config
Message-ID: <bug-2119-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2119

           Summary: Tries to build kernel, although disabled in config
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jsteckli at os.inf.tu-dresden.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


My config contains:

#
# Kernel
#
# BR2_LINUX_KERNEL is not set

Yet, I get:

[... build output ...]
>>>   Downloading kernel
--2010-06-25 17:15:26-- 
http://www.kernel.org/pub//linux/kernel/v2.6//linux-.tar.bz2
Resolving www.kernel.org... 130.239.17.4, 199.6.1.164
Connecting to www.kernel.org|130.239.17.4|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-06-25 17:15:27 ERROR 404: Not Found.

--2010-06-25 17:15:27--  http://buildroot.net/downloads/sources//linux-.tar.bz2
Resolving buildroot.net... 140.211.167.224
Connecting to buildroot.net|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://sources.buildroot.net//linux-.tar.bz2 [following]
--2010-06-25 17:15:27--  http://sources.buildroot.net//linux-.tar.bz2
Resolving sources.buildroot.net... 88.198.64.109
Connecting to sources.buildroot.net|88.198.64.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-06-25 17:15:27 ERROR 404: Not Found.

make: ***
[/home/julian/src/linux-dev/buildroot/output/build/linux-/.stamp_downloaded]
Error 8


This is with the current version from git. Config is attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
