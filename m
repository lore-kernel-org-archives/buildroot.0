From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:26 +0200
Subject: [Buildroot] [PATCH 00/11] Remove BR2_DEBIAN_MIRROR & related changes
Message-ID: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, this series will completely remove BR2_DEBIAN_MIRROR.
I also did two other changes: bumped minor versions and/or patchlevels
where it seemed safe (did a test-compile) and updated
snapshot.debian.org URLs everywhere to the same date.

Note, Debian uses a new patch-tarball format somewhere, with the
naming <package_name>_<version>-<patchlevel>.debian.tar.<bz2 or xz>,
which is not yet implemented into Buildroot I think.

I also noticed the following regarding packages:

memstat could be bumped - but current BR patch(es) exist
liblockfile - same
input-tools (joystick) - same, also the -5 patch doesn't exist anymore
libcap - same
cvs - same (I guess with cvs+real?)
at - same
rt-tests - same
libaio - same

sysvinit - new debian patches exist, but conflict (?) BR patches
dash - same
alsamixergui - same

cdrkit - debian patch could be added (?)
heirloom-mailx - same

fakeroot - could be bumped even more, but then it will also need libfakeroot

cloop - could be bumped than moved to snapshot.debian.org
psc-lite - same
ltrace - same

Karoly Kasza (11):
  package/*: move download URLs to snapshot.debian.org
  package/*: update snapshot.debian.org snapshot dates
  package/libcap: move download URL back to kernel.org
  package/jimtcl: bump to 0.75, move download URL to
    snapshot.debian.org
  package/hwdata: bump to 0.267, move download URL to
    snapshot.debian.org
  package/ccid: bump to 1.4.18, move download URL to
    snapshot.debian.org
  package/lockdev: add Debian patch, update snapshot.debian.org date
  package/fakeroot: bump to 1.18.4, update snapshot.debian.org date
  package/ca-certificates: bump to 20141019, update snapshot date &
    hash
  boot/grub: update patchlevel, update snapshot.debian.org date
  Config.in: remove BR2_DEBIAN_MIRROR completely

 Config.in                                    |   10 ----------
 boot/grub/grub.mk                            |    4 ++--
 package/alsamixergui/alsamixergui.mk         |    2 +-
 package/at/at.mk                             |    2 +-
 package/ca-certificates/ca-certificates.hash |    4 ++--
 package/ca-certificates/ca-certificates.mk   |    4 ++--
 package/ccid/ccid.mk                         |    6 +++---
 package/cdrkit/cdrkit.mk                     |    2 +-
 package/cvs/cvs.mk                           |    4 ++--
 package/dash/dash.mk                         |    2 +-
 package/fakeroot/fakeroot.mk                 |    4 ++--
 package/heirloom-mailx/heirloom-mailx.mk     |    2 +-
 package/hwdata/hwdata.mk                     |    4 ++--
 package/input-tools/input-tools.mk           |    2 +-
 package/jimtcl/jimtcl.mk                     |   14 ++++++++------
 package/libaio/libaio.mk                     |    2 +-
 package/libcap/libcap.mk                     |    6 ++----
 package/liblockfile/liblockfile.mk           |    2 +-
 package/lockdev/lockdev.mk                   |    3 ++-
 package/lockfile-progs/lockfile-progs.mk     |    2 +-
 package/memstat/memstat.mk                   |    2 +-
 package/mii-diag/mii-diag.mk                 |    2 +-
 package/rsh-redone/rsh-redone.mk             |    2 +-
 package/rt-tests/rt-tests.mk                 |    2 +-
 package/setserial/setserial.mk               |    2 +-
 package/sredird/sredird.mk                   |    2 +-
 package/sysvinit/sysvinit.mk                 |    4 ++--
 package/thttpd/thttpd.mk                     |    2 +-
 package/usbmount/usbmount.mk                 |    2 +-
 package/whois/whois.mk                       |    2 +-
 30 files changed, 47 insertions(+), 56 deletions(-)

-- 
1.7.10.4
