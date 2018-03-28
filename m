From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Mar 2018 13:11:32 +0000
Subject: [Buildroot] [Bug 10896] New: /bin/sh not in /etc/shells
Message-ID: <bug-10896-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10896

            Bug ID: 10896
           Summary: /bin/sh not in /etc/shells
           Product: buildroot
           Version: 2018.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: posted at heine.so
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

I just updated my buildroot build from 2017.11 to 2018.02. 
It broke my root ssh login.

I see the following message in my journal: 

  dropbear[383]: User 'root' has invalid shell, rejected

In 2017.11 there was no /etc/shells. Now there is one.
My /etc/shells contains only /bin/bash. But not /bin/sh. But my root users has
/bin/sh as shell, so the error makes sense.

Some quick comparison shows that the file /etc/shells was added in this commit:

4d279697afbf8fb2952 package/bash: add /bin/bash to /etc/shells

I see on the mailing list Romain Naour posted a series of commits which would
also add /bin/sh to shells in the skeleton-init-common. But this is still not
applied.

So I would suggest to either apply the patch series for the next maintenance
release or remove the before mentioned commit.


Regards,
Michael

-- 
You are receiving this mail because:
You are on the CC list for the bug.
