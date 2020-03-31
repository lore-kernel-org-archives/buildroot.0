From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Mar 2020 12:43:44 +0000
Subject: [Buildroot] [Bug 12726] New: systemctl preset-all failed for
 ctrl-alt-del.target
Message-ID: <bug-12726-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12726

            Bug ID: 12726
           Summary: systemctl preset-all failed for ctrl-alt-del.target
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: melanie at trash-mail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8421
  --> https://bugs.busybox.net/attachment.cgi?id=8421&action=edit
Console log output

When finalizing target directory, buildroot executes the 'systemctl preset-all'
command to preset (enable/disable) all systemd unit files.
This command runs successful during a full rebuild (after 'make clean'),
however on subsequent partial rebuild attempts it fails with exit code 1 (log
output attached).

A very similar issue was reported to the systemd-developers (ref [1]) but
closed as 'not-a-bug'.

A possible solution that works for me is to add the '--force' option to the
command.



[1] https://github.com/systemd/systemd/issues/12304#issuecomment-483168112

-- 
You are receiving this mail because:
You are on the CC list for the bug.
