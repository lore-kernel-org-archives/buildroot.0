From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Feb 2011 12:20:48 +0000 (UTC)
Subject: [Buildroot] [Bug 3181] New: dhcp.mk copies S80dhcp-server to
 output/target/etc/init.d, not init.d
Message-ID: <bug-3181-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3181

           Summary: dhcp.mk copies S80dhcp-server to
                    output/target/etc/init.d, not init.d
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dmitry at radiofid.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


buildroot v2011.02-git-00303-ga9eed3f-dirty

dhcp.mk:
24     $(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server
$(TARGET_DIR)/etc/init.d
35     $(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay
$(TARGET_DIR)/etc/init.d

These lines copy file to init.d file, not directory, which breaks other package
instalation since it is impossible to copy init scripts to none existent init.d
directory.

My solution is to add a slash to the end of lines.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
