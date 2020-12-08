From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 Dec 2020 12:57:56 +0000
Subject: [Buildroot] [Bug 13366] New: make pkg-stats: unrelated CVEs linked
 to linux package
Message-ID: <bug-13366-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13366

            Bug ID: 13366
           Summary: make pkg-stats: unrelated CVEs linked to linux package
           Product: buildroot
           Version: 2020.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: seems.deviant at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8701
  --> https://bugs.busybox.net/attachment.cgi?id=8701&action=edit
hypertext

Steps to reproduce:

$ cat <<EOF > .config
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> EOF

$ make pkg-stats

In my case, there are 110 CVEs linked to linux package, while most of them or
none at all are related.

The last three entries in CVEs column:

https://security-tracker.debian.org/tracker/CVE-2013-2032 - mediawiki
https://security-tracker.debian.org/tracker/CVE-2014-3250 - puppet
https://security-tracker.debian.org/tracker/CVE-2014-4909 - transmission

-- 
You are receiving this mail because:
You are on the CC list for the bug.
