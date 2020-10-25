From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 25 Oct 2020 23:24:55 +0300
Subject: [Buildroot] [PATCH v2 0/2] package/gpsd: bump version
Message-ID: <20201025202457.1009025-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Bernd, Olivier, and all,

This patch series updates gpsd to v3.21. In addition to deprecating
several build options, this patch series also enables gpsd python
support. Brief overview of changes:

- bump gpsd version
- move deprecated options to Config.legacy.in
- enable gpsd python support

If python is enabled, then gpsd python modules and tools are installed
unconditionally. Otherwise, if gpsd python support is selected explicitly,
python3 is selected.

Original patch series has been posted by Olivier Dautricourt about two
months ago. I updated commit messages and modified gpsd python support
according to review comments.

Regards,
Sergey

v1 -> v2:
- update license file checksum
- update python support according to review comments


Olivier Dautricourt (1):
  package/gpsd: bump version to 3.21

Sergey Matyukevich (1):
  package/gpsd: enable python support and modules

 Config.in.legacy                              |  20 +++
 ...s-during-gpsd-3.20-cross-compilation.patch | 148 ------------------
 package/gpsd/Config.in                        |  26 ++-
 package/gpsd/gpsd.hash                        |   4 +-
 package/gpsd/gpsd.mk                          |  24 +--
 5 files changed, 45 insertions(+), 177 deletions(-)
 delete mode 100644 package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch

-- 
2.29.1
