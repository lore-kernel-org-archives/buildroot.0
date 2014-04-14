From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 14 Apr 2014 11:25:35 +0200
Subject: [Buildroot] [PATCH 0/2] systemd: add compatibility libs option
Message-ID: <1397467537-22766-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This small series is an alternative to the solution provided by Vicente
Olivert Riera for fixing the build of liblogging with systemd
(http://lists.busybox.net/pipermail/buildroot/2014-April/094039.html).

Since systemd 209, some libraries have been merged into libsystemd.so, but
liblogging (and maybe others) still look for them. As systemd provides an
option to install some compatibility pkg-config files, this patch adds a new
configuration option to enable it. liblogging selects this option if systemd
is chosen as init system. When liblogging will be updated to support
libsystemd.so, this could be removed.

Best regards,
ELB

Eric Le Bihan (2):
  systemd: add option to enable compatibility libs
  liblogging: enable systemd compatibility libs

 package/liblogging/Config.in |  1 +
 package/systemd/Config.in    | 13 +++++++++++++
 package/systemd/systemd.mk   |  4 ++++
 3 files changed, 18 insertions(+)

--
1.9.1
