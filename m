From: Petr Kulhavy <brain@jikos.cz>
Date: Tue, 18 Oct 2016 10:55:26 +0200
Subject: [Buildroot] systemd-timesyncd fails to start
Message-ID: <e98da8cb-40e1-c8bf-4393-dfff8c828d79@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

there is a peculiar problem with systemd NTP synchronization, that in 
the default rootfs the systemd-timesyncd.service always fails to start.
The reason is that systemd-timesyncd requires the /var/tmp to be a 
permanent storage and not just a link to /tmp.
See the second comment on this page: 
https://bbs.archlinux.org/viewtopic.php?id=151937
And really, if I replace the symlink with an empty folder it starts working.

I'm wondering what is the proper way to fix this. By default buildroot 
creates /var/tmp as a link to /tmp, however
on some platforms the rootfs might be read-only or very limited in 
space, so making /var/tmp permanent might break other things...

It would be greatly appreciated if anybody could shed more light on this.

Thanks
Petr
