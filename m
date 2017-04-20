From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Apr 2017 09:35:50 +0000
Subject: [Buildroot] [Bug 9826] New: post-build scritp - symlinks created in
 post-build script are overwritten after exit of the script
Message-ID: <bug-9826-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9826

            Bug ID: 9826
           Summary: post-build scritp - symlinks created in post-build
                    script are overwritten after exit of the script
           Product: buildroot
           Version: 2017.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: timo.valimaki at sensoan.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm trying to symlink  /etc/group, /etc/passwd and /etc/shadow to RW partition,
in my case to /data/etc (rootfs-overlay).


I created a post-build that moves above files to /data/etc/ directory and
creates symlinks pointing to the moved files. When I'm pausing my post-build
script just before the exit everything is looking fine.

/output/target:

lrwxrwxrwx  1 timo timo    17 huhti 20 12:24 group -> ../data/etc/group
lrwxrwxrwx  1 timo timo    18 huhti 20 12:24 passwd -> ../data/etc/passwd
lrwxrwxrwx  1 timo timo    18 huhti 20 12:24 shadow -> ../data/etc/shadow

But when the Buildroot build is finished the above symlinks are overwritten
-rw-r--r--  1 timo timo   320 huhti 20 12:29 group
-rw-r--r--  1 timo timo   389 huhti 20 12:29 passwd
-rw-------  1 timo timo   291 huhti 20 12:29 shadow

Q: Is this as specified or a bug?
Q: If as specified, what is correct way to symlink above files?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
