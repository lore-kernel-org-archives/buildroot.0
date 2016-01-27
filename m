From: Weber, Holger <Holger.Weber@cobham.com>
Date: Wed, 27 Jan 2016 14:06:54 +0000
Subject: [Buildroot] ulimit.conf - rtprio permissions for normal users
Message-ID: <9C21FA313B3F9749AA4A75A92FB291B458A09244@VMEXCH2010ENT.telerob.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I try to run a program which needs realtime priority as a normal user.
If I do so, I get an error because a normal user is not allowed to set rt prio.
On my linux pc I only need to edit /etc/security/limit.conf and add a line like
user - rtprio 99

First I added the pam library to my buildroot configuration to get this file. But
it still doesn't work. For completion the program is started out of an init script with
start-stop-daemon which also changes the user to e.g. ftp.
I also read that limit.conf settings are only applied if the user logs in, what in this case
doesn't happen (start-stop-daemon).
Is there another possibility to change the rt rights?

Thanks,
Holger
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160127/d481cd73/attachment.html>
