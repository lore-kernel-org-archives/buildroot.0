From: theHog <lists@t3i.nl>
Date: Wed, 17 Dec 2008 00:43:04 +0100
Subject: [Buildroot] Issue with login
Message-ID: <20081217004304.7b1ozl8hickg4gsg@webmail.dds.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I built a rootfs using buildroot and mounted it over nfs on a Atmel  
ARM9 board. The
boards boots OK, but when it gets to the login prompt, logging in doesn't
seem to work. The login prompt appears again after I type the name and
password.

I checked various thing:
- permissions on files seems OK,
- /etc/securetty contains ttyS0 (only way for now to get in),
- the password itself in /etc/passwd,
- login, sh and getty binaries are in place.

I have access to the /var/log/messages file since the root fs is mounted from
nfs. It just repeats the following for every login attempt:
Dec 31 17:27:53 eddy auth.info login[716]: root login on 'ttyS0'
Dec 31 17:27:53 eddy daemon.info init: process '/sbin/getty -L ttyS0 115200
vt100' (pid 716) exited. Scheduling for restart.
Dec 31 17:27:53 eddy daemon.info init: starting pid 717, tty '/dev/ttyS0':
'/sbin/getty -L ttyS0 115200 vt100'

I used a pretty out-of-the-box config for buildroot (it's attached). What
could be wrong here?

Thanks,

Richard.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-config
Type: application/octet-stream
Size: 17299 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081217/cf3c483c/attachment-0001.obj 
