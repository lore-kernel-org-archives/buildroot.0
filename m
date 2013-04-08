From: Francesco Montorsi <francesco.montorsi@gmail.com>
Date: Mon, 8 Apr 2013 16:30:28 +0000 (UTC)
Subject: [Buildroot] syslog messages during boot not recorded?
Message-ID: <loom.20130408T181747-784@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I'm using buildroot v10.11 on an embedded system running Linux kernel 
2.6.32.2.

I installed some daemons wrote by me which are started at boot time by some 
/etc/init.d scripts of mine. These daemons use many syslog() to provide 
verbose debugging messages... however, for some reason, when I boot the 
system and cat /var/log/messages, I do not see any message.
If I start manually the daemons, the messages are correctly logged to 
/var/log/messages... 

I think that this problem maybe because syslogd is startd AFTER all 
/etc/init.d scripts have been processed.. is that right?


I tried to comment the lines:

null::respawn:/sbin/syslogd -n -m 0
null::respawn:/sbin/klogd -n

contained in /etc/inittab and then to add the S01logging script found in 
this patch:
http://lists.busybox.net/pipermail/buildroot/2011-July/043828.html

but I obtained the same results... (of course my etc scripts start with S90, 
S91, etc, so they should run AFTER S01logging...)

Thanks for any hint!
Francesco
