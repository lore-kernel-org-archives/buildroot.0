From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 May 2016 20:24:56 +0000
Subject: [Buildroot] [Bug 8941] New: "ls" of an NFSv4 share only works when
 pumped through strace
Message-ID: <bug-8941-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8941

            Bug ID: 8941
           Summary: "ls" of an NFSv4 share only works when pumped through
                    strace
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: stevejhorton at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Buildroot = Nightly build commit (46f9454ae177f309c226f4cb8fe7b7f68a109b29)
nfs-utils = 1.3.3
busybox = 1.24.1 also tried 1.24.2
Network = 10 Gigabit Ethernet on all hosts

I'm placing the bug here because I can't tell if it's a buildroot or a busybox
issue. 

NOTES: With a good NFS mount from a buildroot image I can not see the file
names unless I use strace like so. 
------------------------

# ls -la /share/FILES   # I get nothing

# strace -o /dev/null ls -la /share/FILES/
total 44
drwxrwxrwx    4 42949672 42949672      4096 Apr  4 15:58 .
drwxrwxrwx 1045 42949672 42949672     32768 May 18 20:03 ..
drwxrwxrwx    2 42949672 42949672      4096 May 18 15:05 dir1
drwxrwxrwx    2 42949672 42949672      4096 Apr  4 15:58 dir2

# nfsstat -m
/share from server:/lab/1
 Flags:
rw,relatime,vers=4.0,rsize=1048576,wsize=1048576,namlen=255,hard,proto=tcp,port=0,timeo=14,retrans=2,sec=sys,clientaddr=10.10.50.230,local_lock=none,addr=10.10.90.10

# 
Any Ideas?
Many Thanks!
-S

-- 
You are receiving this mail because:
You are on the CC list for the bug.
