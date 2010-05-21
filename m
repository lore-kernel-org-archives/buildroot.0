From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 21:44:49 +0000 (UTC)
Subject: [Buildroot] [Bug 1771] Fakeroot and the
 target/generic/device_table.txt create bad device nodes.
In-Reply-To: <bug-1771-163@https.bugs.busybox.net/>
References: <bug-1771-163@https.bugs.busybox.net/>
Message-ID: <20100521214449.492C299B36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1771

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I just made a test with the default target/generic/device_table.txt and the
result for hd* is good :


fs/dev$ ls -l hd*
brw-r----- 1 root root 3,  0 2010-05-21 23:31 hda
brw-r----- 1 root root 3,  1 2010-05-21 23:31 hda1
brw-r----- 1 root root 3, 10 2010-05-21 23:31 hda10
brw-r----- 1 root root 3, 11 2010-05-21 23:31 hda11
brw-r----- 1 root root 3, 12 2010-05-21 23:31 hda12
brw-r----- 1 root root 3, 13 2010-05-21 23:31 hda13
brw-r----- 1 root root 3, 14 2010-05-21 23:31 hda14
brw-r----- 1 root root 3,  2 2010-05-21 23:31 hda2
brw-r----- 1 root root 3,  3 2010-05-21 23:31 hda3
brw-r----- 1 root root 3,  4 2010-05-21 23:31 hda4
brw-r----- 1 root root 3,  5 2010-05-21 23:31 hda5
brw-r----- 1 root root 3,  6 2010-05-21 23:31 hda6
brw-r----- 1 root root 3,  7 2010-05-21 23:31 hda7
brw-r----- 1 root root 3,  8 2010-05-21 23:31 hda8
brw-r----- 1 root root 3,  9 2010-05-21 23:31 hda9
brw-r----- 1 root root 3, 64 2010-05-21 23:31 hdb
brw-r----- 1 root root 3, 65 2010-05-21 23:31 hdb1
brw-r----- 1 root root 3, 74 2010-05-21 23:31 hdb10
brw-r----- 1 root root 3, 75 2010-05-21 23:31 hdb11
brw-r----- 1 root root 3, 76 2010-05-21 23:31 hdb12
brw-r----- 1 root root 3, 77 2010-05-21 23:31 hdb13
brw-r----- 1 root root 3, 78 2010-05-21 23:31 hdb14
brw-r----- 1 root root 3, 66 2010-05-21 23:31 hdb2
brw-r----- 1 root root 3, 67 2010-05-21 23:31 hdb3
brw-r----- 1 root root 3, 68 2010-05-21 23:31 hdb4
brw-r----- 1 root root 3, 69 2010-05-21 23:31 hdb5
brw-r----- 1 root root 3, 70 2010-05-21 23:31 hdb6
brw-r----- 1 root root 3, 71 2010-05-21 23:31 hdb7
brw-r----- 1 root root 3, 72 2010-05-21 23:31 hdb8
brw-r----- 1 root root 3, 73 2010-05-21 23:31 hdb9

In the device list you pasted, the minor numbers are incorrect. hda should be
3:0, hda1 should be 3:1, hda2 3:2, hdb should be 3:64, hdb1 3:65, hdb2 3:66.
hdc is 22:0, hdc1 is 22:1, etc. See Documentation/devices.txt in the Linux
kernel source tree for the official reference.

So I don't see what's wrong in Buildroot. Could explain in more details what is
the problem for you ?

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
