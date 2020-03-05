From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Mar 2020 22:30:29 +0000
Subject: [Buildroot] [Bug 12611] New: ntp hash is not matching with upstream
 4.2.8p13
Message-ID: <bug-12611-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12611

            Bug ID: 12611
           Summary: ntp hash is not matching with upstream 4.2.8p13
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mjhammel at graphics-muse.org
                CC: buildroot at uclibc.org
  Target Milestone: ---

I was building 2019.05.1 and found ntp 4.2.8p13 hash didn't match with
upstream.  I checked 2020.02rc3 and it has the same hash as 2019.05.1.  Then
checking upstream ntp I found this.

   [ ]  ntp-4.2.8p13.tar.gz     2020-03-03 19:54        6.7M     
   [ ]  ntp-4.2.8p13.tar.gz.md5 2020-03-03 19:54        61       
   [ ]  ntp-4.2.8p13.tar.gz.sha1        2019-03-07 06:18        62       
   [ ]  ntp-4.2.8p13.tar.gz.sha256      2020-03-03 19:54        96       
   [ ]  ntp-4.2.8p13.tar.gz.sha512      2019-03-07 06:18        150      
   [ ]  ntp-4.2.8p14.tar.gz     2020-03-03 20:45        6.7M     
   [ ]  ntp-4.2.8p14.tar.gz.md5 2020-03-03 20:45        61       
   [ ]  ntp-4.2.8p14.tar.gz.sha256      2020-03-03 20:45        96

It looks like both 4.2.8p13 and 4.2.8p14 were updated the same day, except for
the former's sha1.  I can also verify that the 4.2.8p13 tar.gz is larger than
my local archive.

Not sure what to do with this.  Might be someone upstream just updated the
archives and messed it up.  But I wasn't sure how to report that to the
upstream.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
