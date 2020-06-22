From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Jun 2020 04:51:59 +0000
Subject: [Buildroot] [Bug 13016] New: When fcntl with F_SETFL is called from
 vsftpd functions, it hangs during file request from the client
Message-ID: <bug-13016-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13016

            Bug ID: 13016
           Summary: When fcntl with F_SETFL is called from vsftpd
                    functions, it hangs during file request from the
                    client
           Product: buildroot
           Version: 2020.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: prabhusannachi at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8511
  --> https://bugs.busybox.net/attachment.cgi?id=8511&action=edit
This patch allows fcntl with F_SETFL and no filters.

The fcntl function with F_SETFL is called from various portion of the vsftpd to
activate and deactivate block on the file, hangs when client request a file
from the server. This happens when seccomp_sandbox is enabled in the
configuration.
vsftpd version is 3.0.3

Similar issue has been addressed on 3.0.2 and fixed on other distribution.

Reference:
https://build.opensuse.org/package/view_file/SUSE:SLE-12-SP1:GA/vsftpd.2254/vsftpd-enable-fcntl-f_setfl.patch?expand=1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
