From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 May 2017 13:31:57 +0000
Subject: [Buildroot] [Bug 9866] New: BASE_DIR usage
Message-ID: <bug-9866-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9866

            Bug ID: 9866
           Summary: BASE_DIR usage
           Product: buildroot
           Version: 2017.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm trying to use the printvars target from a post image shell script and I
would like this script to support both default output directory ie
buildroot/output as well as O= option.
Thus I'm calling the printvars target as follow :
make -C ${BASE_DIR} printvars
However this code will only work if O= option is used, since in this case the
BASE_DIR directory will contain the main Makefile.
Is there any variable that will contain the directory which contains the main
Makefile file ?
Wouldn't it be more coherent if the BASE_DIR would point to directories with
similar content without depending on O= option ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
