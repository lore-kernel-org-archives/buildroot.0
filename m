From: Karoly Pados <kp@tec4data.at>
Date: Mon, 13 Mar 2017 11:13:52 +0000
Subject: [Buildroot] [DEPEND] Dependency failed for Serial Getty on ttyS0.
Message-ID: <c3cba7c6739845276c207fcf05e970b8@webmail.pados.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

I built a buildroot image, using systemd as the init system. The kernel is built using buildroot too, using a custom kernel-.config that is known to work on same hardware when used outside of buildroot.

Most of the booting process succeeds, but towards the end systemd repeatedly tries to stop and start getty, then after a minute or two outputs:
[DEPEND] Dependency failed for Serial Getty on ttyS0.

Booting then continues with UTMP, but no login prompt is shown. Not on UART and neither on VGA. I've found out that others who got this same phenomenon had to enable CONFIG_FHANDLE for the kernel, but for me it is already enabled.

Steps I used:
- clone buildroot from git
- checkout 2017.02.x branch
- make menuconfig (enabled systemd, disabled busybox, added a whole lot of other stuff)
- make
- flashed/installed images from output/images/

Here is a link to my buildroot-config: http://pastebin.com/W8KnZccU

Any help is appreciated.

Greetings,
Karoly
