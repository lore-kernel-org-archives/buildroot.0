From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 16:45:33 +0000
Subject: [Buildroot] [Bug 10641] New: avahi-autoipd not starting when using
 systemd-tempfiles
Message-ID: <bug-10641-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10641

            Bug ID: 10641
           Summary: avahi-autoipd not starting when using
                    systemd-tempfiles
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: posted at heine.so
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

I have a systemd based system. When I want to start avahi-autoipd it quits with
the following message:

"stat(): No such file or directory"

I debugged a bit and found a typo in package/avahi/avahi_tmpfiles.conf

It should be "/tmp/avahi-autoipd" instead of "/tmp/avahi-autopid". (twisted
ip/pi)

When I change this in my builded system in /usr/lib/tmpfiles.d/avahi.conf
it seems to work fine after reboot.

So I guess nobody used the combination of avahi-autoipd and systemd since the
commit in 2014. Or did I misunderstood something?

Regards,
Michael

-- 
You are receiving this mail because:
You are on the CC list for the bug.
