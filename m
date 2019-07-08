From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 08 Jul 2019 13:00:50 +0000
Subject: [Buildroot] [Bug 12011] New: cronstamps directory is not created by
 dcron package
Message-ID: <bug-12011-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12011

            Bug ID: 12011
           Summary: cronstamps directory is not created by dcron package
           Product: buildroot
           Version: 2019.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dominique.tronche at atos.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

In package dcron makefile, the per-users directory /var/spool/cron/crontabs is
created but not the timestamp directory /var/spool/cron/cronstamps.
As a consequence, the cron jobs from /etc/cron.hourly, /etc/cron.daily,... do
not work

When crond is run manually we get the error message:
no timestamp found (user root job sys-hourly)
unable to write timestamp to /var/spool/cron/cronstamps/root.sys-hourly (user
root job sys-hourly)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
