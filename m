From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Jan 2011 20:36:41 +0000 (UTC)
Subject: [Buildroot] [Bug 3169] New: python patch has typo,
	aborts build in scenario
Message-ID: <bug-3169-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3169

           Summary: python patch has typo, aborts build in scenario
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: markw at digi.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2899
  --> https://bugs.busybox.net/attachment.cgi?id=2899
Proposed patch to python patch 005

Pulled from git repository, CHANGES says: 2011-02, not yet released.

python package patch file python-2.7-005-staging-headers-libs.patch has typo in
modules_lib_dirs section, causing build abort if PYTHON_MODULES_LIB is not
specified during build.

+        try:
+            modules_lib_dirs = os.environ["PYTHON_MODULES_LIB"].split()
+        except KeyError:
+            modules_include_dirs = ['/usr/lib']

modules_include_dirs should be modules_lib_dirs:

+            modules_lib_dirs = ['/usr/lib']

Proposed patch to patch is attached, or you could replace existing patch.  No
attribution is necessary.

Thanks.

Mark Wickham
Digi International

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
