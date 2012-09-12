From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 12 Sep 2012 16:01:49 +0100
Subject: [Buildroot] [network-manager] Apply upstream patch to fix
 compilation with kernel-headers >= 3.4
Message-ID: <CAG2jQ8g+0WkYnR2k-8jaLXHOFRA2OPiuQWeD==B6gdE67N=4OA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Since kernel-3.4_rc1, commit
bf7daebb9fba540cb8864f435f153678b3e5c171[1], the ifpppstatsreq
structure has been removed. This leads to compilation problems for
network-manager in buildroot if one uses kernel-headers >= 3.4.
Upstream fixed this problem in commit
	6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f[2]. Please consider applying
this patch to the buildroot package. If a git commit with a Signed-off
line is required for that, please let me know and I will provide one.
Another way to solve this problem is to bump to the latest 0.9.6
release.

Regards,
Markos

[1] http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=bf7daebb9fba540cb8864f435f153678b3e5c171
[2] http://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/src/ppp-manager/nm-ppp-manager.c?id=6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f
