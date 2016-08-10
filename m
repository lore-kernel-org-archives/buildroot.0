From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Aug 2016 08:51:13 +0000
Subject: [Buildroot] [Bug 9161] New: modsetting patch not applied to xserver
	1.18.4
Message-ID: <bug-9161-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9161

            Bug ID: 9161
           Summary: modsetting patch not applied to xserver 1.18.4
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: develop at manuel-voegele.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

The "modesettings-needs-dri2" patch isn't applied to the xserver version 1.18.4
in buildroot 2016.08-rc1

I managed to hotfix this locally by renaming
"package/x11r7/xserver_xorg-server/1.18.3" to "1.18.4". However the commit
which introduced this directory (bb6bd531c97734b7be2ec24670771dc10aef1791)
mentions that this patch has to be applied to all versions >= 1.17.2. Since
version 1.17.4 was added in this release there might be additional steps
required to ensure both versions will be patched.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
