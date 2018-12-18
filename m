From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 18 Dec 2018 03:02:33 -0200
Subject: [Buildroot] [PATCH 0/2] Add a sysctl init script
Message-ID: <20181218050235.27187-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simple init script that invokes sysctl early in the initialization
process to configure kernel parameters. This is already performed by
systemd (systemd-sysctl) but there is no sysvinit/busybox counterpart.

Files are read from directories in the following list in the given order
from top to bottom:

    /run/sysctl.d/*.conf
    /etc/sysctl.d/*.conf
    /usr/local/lib/sysctl.d/*.conf
    /usr/lib/sysctl.d/*.conf
    /lib/sysctl.d/*.conf
    /etc/sysctl.conf

Carlos Santos (2):
  package/procps-ng: add init script for sysctl
  package/busybox: add init script for sysctl

 package/busybox/S01sysctl      | 63 ++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk     | 12 +++++++
 package/procps-ng/S01sysctl    | 41 ++++++++++++++++++++++
 package/procps-ng/procps-ng.mk |  5 +++
 4 files changed, 121 insertions(+)
 create mode 100644 package/busybox/S01sysctl
 create mode 100644 package/procps-ng/S01sysctl

-- 
2.19.2
