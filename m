From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Wed, 13 Jun 2007 12:57:42 +0200
Subject: [Buildroot] busybox ifup and /var/run/ifstate
Message-ID: <20070613105742.GA7909@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there!

Actually I am trying to get buildroot-20070607 running fine with
busybox-1.6.0 to release a rootfs for our customers.

What I realize is, that after halt or reboot /var/run/ifstate does not
cleared and a boot does not bring up eth0 because of this:

ifup: interface lo already configured
ifup: interface eth0 already configured

When I do "ifdown -a" before rebooting /var/run/ifstate gets celared and
a boot brings up the interfaces. How is this done automatically?
I did not have this PRelbem with older buildroot (may be even busybox
only is concerned) versions.

I tried to pimp my /etc/inittab this way

null::shutdown:/usr/bin/killall klogd
null::shutdown:/usr/bin/killall syslogd
null::shutdown:/sbin/ifdown -a
null::shutdown:/bin/umount -a -r

But the shutdown entries are not run in my uclibc system, may be due to
the lack of "shutdown"?

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
