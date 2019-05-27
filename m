From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 May 2019 12:46:52 +0000
Subject: [Buildroot] [Bug 11916] New: getfattr 2.4.48 issue
Message-ID: <bug-11916-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11916

            Bug ID: 11916
           Summary: getfattr 2.4.48 issue
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

It seems that since attr was updated to v2.4.48, the getfattr command is not
working properly anymore.

The following tests were done with BR 2018.02.4 (2.4.47), BR 2018.02.5 (2.4.48)
and BR 2019.02.2 with getfattr and libattr.so* being copied to /home/guest and
the LD_LIBRARY_PATH set accordingly.

BR 2018.02.4 :
#  /home/guest/getfattr --version
getfattr 2.4.47
#  /home/guest/getfattr /bin/ls

BR 2018.02.5/2019.02.2
#  /home/guest/getfattr --version
getfattr 2.4.48
#  /home/guest/getfattr /bin/ls
/home/guest/getfattr: relocation error: /home/guest/getfattr: symbol listxattr,
version ATTR_1.0 not defined in file libattr.so.1 with link time reference

Regards

-- 
You are receiving this mail because:
You are on the CC list for the bug.
