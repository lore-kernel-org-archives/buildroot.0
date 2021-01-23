From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 23 Jan 2021 11:31:49 +0100
Subject: [Buildroot] [PATCH 0/6] package/mrouted: bump version and improve
 integration
Message-ID: <20210123103155.2599311-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi! :)

This series updates mrouted to the latest version[1], verifies that the
kernel config actually has multicast routing enabled, adds the missing
SysV init script, and replaces the hard-coded enabling of RSRR support
with a menuconfig option.  RSRR really is experimental and should not be
enbled by default.

Best regards
 /Joachim

[1]: Release notes; https://github.com/troglobit/mrouted/releases/tag/4.2

Joachim Wiberg (6):
  package/mrouted: bump to version 4.2
  package/mrouted: ensure multicast routing is enabled in kernel
  package/mrouted: update description a bit, mention oper. requirement
  package/mrouted: add sysv init script
  package/mrouted: for merged usr, install to /usr by default, not /
  package/mrouted: menuconfig support for enabling rsrr support

 package/mrouted/Config.in    | 18 +++++++++++
 package/mrouted/S41mrouted   | 62 ++++++++++++++++++++++++++++++++++++
 package/mrouted/mrouted.hash |  6 ++--
 package/mrouted/mrouted.mk   | 15 +++++++--
 4 files changed, 96 insertions(+), 5 deletions(-)
 create mode 100755 package/mrouted/S41mrouted

-- 
2.25.1
