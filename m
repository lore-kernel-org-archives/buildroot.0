From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 15 Mar 2012 08:38:18 -0700
Subject: [Buildroot] vsftpd
Message-ID: <CALo-6+jE0XhxMv2xO-EtOLjnrwR8DC9DPH5U0zeV6qst_F-WaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

its my day to be a "noob" again as I am having trouble getting vsftpd
accepting connections on an MPC8321 project. I am near the end of my
project after a year and started with buildroot 2011.03 last spring
and today is the day to enable vsftpd and ntp-wait.

I enable the vsftpd package, it builds, and I get a /usr/sbin/vsftpd
and /etc/init.d/S70vsftpd on the MPC8321 target. When the target
boots, it does say "Starting vsftpd: OK" on the console.

The package does not create an /etc/vsftpd.conf, so I created one that
looks like this:

# cat /etc/vsftpd.conf
anonymous_enable=YES
anon_root=/home/econolite
local_enable=YES
#

Now for the bad news. Connections are refused from an external host,
making me think vsftpd is not really running. A "ps" does not show
vftpd in its list. A "netstat" does not show ftp. Invoking vsftpd from
a bash prompt says:

# vsftpd
500 OOPS: vsftpd: not configured for standalone, must be started from inetd
#

So, can someone help me navigate through the "Valley of Confusion"
towards the "Ridge of Enlightment" so I can get to the next problem
which is "why the frick cannot I get microperl to compile".

Charles "Noob For The Day" Krinke


-- 
Charles Krinke
