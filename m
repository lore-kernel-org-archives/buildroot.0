From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  7 Jul 2015 21:02:31 +0000 (UTC)
Subject: [Buildroot] [Bug 8081] systemd init system: /tmp is not mode 1777
In-Reply-To: <bug-8081-163@https.bugs.busybox.net/>
References: <bug-8081-163@https.bugs.busybox.net/>
Message-ID: <20150707210231.F16AE8078F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8081

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-07 21:02:31 UTC ---
Are you sure you have not done some mistake? I just tested generating an initrd
with systemd support, and it boots fine under Qemu, and /tmp has 1777 access
rights:

# ls -l /
total 4
drwxr-xr-x    2 root     root             0 Jul  7 21:00 bin
drwxr-xr-x    7 root     root          2980 Jul  7 21:01 dev
drwxr-xr-x   15 root     root             0 Jul  7 21:01 etc
drwxr-xr-x    3 root     root             0 Mar  8  2014 home
-rwxr-xr-x    1 root     root           176 Jul  7 20:50 init
drwxr-xr-x    4 root     root             0 Jul  7 21:00 lib
lrwxrwxrwx    1 root     root             3 Jul  7 15:57 lib32 -> lib
lrwxrwxrwx    1 root     root            11 Jul  7 15:58 linuxrc -> bin/busybox
drwxr-xr-x    2 root     root             0 Oct  4  2014 media
drwxr-xr-x    2 root     root             0 Oct  4  2014 mnt
drwxr-xr-x    2 root     root             0 Oct  4  2014 opt
dr-xr-xr-x   44 root     root             0 Jan  1  1970 proc
drwx------    2 root     root             0 Jul  7 21:01 root
drwxr-xr-x    9 root     root           240 Jul  7 21:01 run
drwxr-xr-x    2 root     root             0 Jul  7 21:00 sbin
drwxr-xr-x    2 root     root             0 Jul  7 21:01 srv
dr-xr-xr-x   12 root     root             0 Jul  7 21:01 sys
drwxrwxrwt    7 root     root           180 Jul  7 21:01 tmp
drwxr-xr-x    7 root     root             0 Jul  7 21:00 usr
drwxr-xr-x    4 root     root             0 Jul  7 21:01 var

Can you confirm that the issue is still reproducible with the latest Buildroot?

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
