From: PTaylor.us <ptaylor.us@gmail.com>
Date: Sun, 14 May 2017 05:00:00 -0700 (PDT)
Subject: [Buildroot] Why is /var/log symlinked to a tmpfs?
Message-ID: <1494763200132-164905.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First, I must say that buildroot is a great tool. Thank you.

I am using buildroot branch 2016.11.x.

Why is /var/log a symlink to /tmp (which is mounted with a tmpfs). My
understanding is that */var/log should be persistent across reboots*. I'm
very curious why the default skeleton was setup like this. It is causing
problems, for one, with journald where the "fix" I've seen suggested on this
mailing list is to set the logging to "volatile". 



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Why-is-var-log-symlinked-to-a-tmpfs-tp164905.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
