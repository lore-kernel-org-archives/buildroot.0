From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Aug 2017 09:25:50 +0000
Subject: [Buildroot] [Bug 10151] New: toolchain eclipse register : fails
 with a custom BR2_HOST_DIR
Message-ID: <bug-10151-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10151

            Bug ID: 10151
           Summary: toolchain eclipse register : fails with a custom
                    BR2_HOST_DIR
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: frederic.mathieu at dualis.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The toolchain registering fails when a custom HOST directory is defined. 

the script './support/scripts/eclipse-register-toolchain' returns message :
"Your project directory does not look like a Buildroot output"

tested with versions 2017.02.(n), 2017.05.2


in my case, 
BR2_HOST_DIR="$(BASE_DIR)/../../../toolchain/2107.02.3_X86_32/host"
also tested with absolute path :
/home/dev01/data/toolchain/2107.02.3_X86_32/host"


...
./support/scripts/eclipse-register-toolchain `readlink -f
/home/dev01/data/projects/buildroot-2017.02.3_X86_32/output`
i686-buildroot-linux-gnu- "i686"
Your project directory does not look like a Buildroot output
Makefile:655: recipe for target 'target-finalize' failed
make[1]: *** [target-finalize] Error 1
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
