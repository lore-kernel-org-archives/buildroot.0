From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 12 Mar 2020 20:04:32 +0100
Subject: [Buildroot] [PATCH v4 0/1] package/linuxptp: make initscript
 options configurable
Message-ID: <20200312190434.973-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After talking to Michael I've taken his patch and did a new version
with some modifications/improvements.

This series changes the SysV init script to match the prefered style
(used package/busybox/S01syslogd) for init scripts. Since in the old
init script 2 daemons were started this is split in two. The names for
the scripts now matches the daemons they start.

The systemd service scripts are also renamed to match the daemon names
(this is the same name as used in debian).

---
v3 -> v4
 - change default config values for phc2sys
   (use the autoconfigure option -a that does not need the network or PHC
   device)
 - added the Tested-by from Carlos for the previous version
   (I don't know if this is allowed)
 - drop the patch that changes the indentation
   (Carlos Santos proposed to do that with a version bump)

v2 -> v3
 - fix the install hooks to match the renamed files
 - rename the systemd service scripts to have the same name as for the
   SysVinit scripts
 - update the indentation of the hash file

v1 -> v2
 - rename the init script from S65linuxptp to S65ptp4l
 - move the phc2sys stuff to S66phc2sys
 - use the style form package/busybox/S01syslogd as template

Heiko Thiery (1):
  package/linuxptp: make initscript options configurable

 package/linuxptp/S65linuxptp | 46 ----------------------------
 package/linuxptp/S65ptp4l    | 59 ++++++++++++++++++++++++++++++++++++
 package/linuxptp/S66phc2sys  | 59 ++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 46 deletions(-)
 delete mode 100644 package/linuxptp/S65linuxptp
 create mode 100644 package/linuxptp/S65ptp4l
 create mode 100644 package/linuxptp/S66phc2sys

-- 
2.20.1
