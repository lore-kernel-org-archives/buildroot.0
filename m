From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Mar 2021 14:49:09 +0000
Subject: [Buildroot] [Bug 13626] New: Can't connect to openssh-server
Message-ID: <bug-13626-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13626

            Bug ID: 13626
           Summary: Can't connect to openssh-server
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: posta at debevv.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8806
  --> https://bugs.busybox.net/attachment.cgi?id=8806&action=edit
Client and server logs, defconfig

The openssh-server installed on the board abruptly closes the connection before
the key exchange with the client.
I tried fiddling with ciphers and macs on both sides, changing network
interfaces MTUs (I read online that there are issue related to openssh),
changing client, but the problem persists.
sshd_config is the default one.
I also tried with busybox as init, instead as systemd.
I attached the client and server logs and my defconfig.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
