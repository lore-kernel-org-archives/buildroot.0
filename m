From: Chris Packham <judge.packham@gmail.com>
Date: Sat, 26 Sep 2015 23:25:41 +1200
Subject: [Buildroot] [RFC PATCH 0/2] Syslog-ng
Message-ID: <1443266743-20775-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Resurrecting some old patches I had lying around.

Syslog-ng is a very configurable logging system that we've been using at
$dayjob for some time. This patch series includes the latest version.

So far I've only tested with qemu_x86_defconfig so there may be some
build errors lurking. I haven't had a chance to verify systemd support
either.

Chris Packham (2):
  eventlog: New package
  syslog-ng: New package

 package/Config.in              |  4 ++++
 package/eventlog/Config.in     |  5 +++++
 package/eventlog/eventlog.mk   | 14 ++++++++++++
 package/syslog-ng/Config.in    | 18 ++++++++++++++++
 package/syslog-ng/S01logging   | 36 +++++++++++++++++++++++++++++++
 package/syslog-ng/syslog-ng.mk | 49 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 126 insertions(+)
 create mode 100644 package/eventlog/Config.in
 create mode 100644 package/eventlog/eventlog.mk
 create mode 100644 package/syslog-ng/Config.in
 create mode 100644 package/syslog-ng/S01logging
 create mode 100644 package/syslog-ng/syslog-ng.mk

-- 
2.5.0
