From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 23 Dec 2013 09:35:46 +0100
Subject: [Buildroot] [PATCH 0 of 3 v2] Remove some deprecated packages
Message-ID: <patchbomb.1387787746@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


All, 

Here is the feature-removal-schedule, updated, and two removals of
deprecated features.

I did not yet remove LZMA: it is still used for filesystem image
compression. Is this also deprecated, or is only the target package
deprecated? 

Thanks, 
Thomas

---
 Config.in.legacy                                       |  24 +++++++
 docs/manual/appendix.txt                               |   6 +-
 feature-removal-schedule.txt                           |  43 ++++++++++++++
 fs/squashfs/Config.in                                  |  16 -----
 fs/squashfs/squashfs.mk                                |  12 ---
 package/Config.in                                      |   2 -
 package/squashfs3/Config.in                            |  12 ---
 package/squashfs3/squashfs3-3.4-build-system-fix.patch |  37 ------------
 package/squashfs3/squashfs3-3.4-get_nprocs.patch       |  33 ----------
 package/squashfs3/squashfs3.mk                         |  34 -----------
 package/ttcp/Config.in                                 |   7 --
 package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch  |  15 ----
 package/ttcp/ttcp.mk                                   |  25 --------
 13 files changed, 72 insertions(+), 194 deletions(-)
