From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Nov 2020 11:29:41 +0000
Subject: [Buildroot] [Bug 13341] New: Mistake in /etc/init.d/S70vsftpd
Message-ID: <bug-13341-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13341

            Bug ID: 13341
           Summary: Mistake in /etc/init.d/S70vsftpd
           Product: buildroot
           Version: 2020.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tochansky at tochlab.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8686
  --> https://bugs.busybox.net/attachment.cgi?id=8686&action=edit
Sample diff

Found an error in start script for vsftpd - incorrect variable for
'start-stop-daemon' is used - in place of $NAME should be used $DAEMON.

Starting /etc/init.d/S70vsftpd start leads to error message:

Starting vsftpd: start-stop-daemon: unable to stat //vsftpd (No such file or
directory)

After changing $NAME to $DAEMON in script service starts successfuly.

Same problem is in master branch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
