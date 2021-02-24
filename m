From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Feb 2021 08:07:16 +0000
Subject: [Buildroot] [Bug 13561] New: Create a new user defining
 users-table.txt not working fine
Message-ID: <bug-13561-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13561

            Bug ID: 13561
           Summary: Create a new user defining users-table.txt not working
                    fine
           Product: buildroot
           Version: 2020.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: al004140 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I am trying to create a new admin user in my rootfs, following suggested
procedure, with this steps:

$ make menuconfig 
    > System Configuration 
        > (board/company/users-table.txt) Path to the users tables 
    > Save and exit

Then created the file:

$ cat board/company/users-table.txt
admin -1 admin -1 =supersecret /home/admin /bin/sh - Admin user

And finally:

$ make all

The process ends fine, without errors.

After that, the targetfs build doesn't includes admin user nor in /etc/shadow
nor in /etc/passwd. 

However, the same procedure is working as expected when using a buildroot
2018.02.7. Please some help with this! Thx!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
