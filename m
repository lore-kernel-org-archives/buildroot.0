From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:01:57 +0300
Subject: [Buildroot] [PATCH 00/38] systemd support for various packages
Message-ID: <cover.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This set adds systemd support to packages that install sysv
initscripts but not systemd services. The idea is that the
choice between BR2_INIT_SYSV and BR2_INIT_SYSTEMD should affect
the process list in the resulting system as little as possible.

All services start foreground processes (Type=simple), and follow
current initscripts otherwise whenever possible.

This set is not complete, several difficult packages including nfs
were skipped.

All patches are independent, and can be reviewed/commited one at a time
in any order. And this is for the next branch of course.
