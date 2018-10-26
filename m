From: Grzegorz Blach <grzegorz@blach.pl>
Date: Fri, 26 Oct 2018 22:00:14 +0200
Subject: [Buildroot] [PATCH 0/2] Creating a sparse file in ROOTFS_F2FS_CMD
Message-ID: <20181026200016.30856-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure if creating a sparse file using `dd` command from host OS
is acceptable.  Maybe it's needed to find a better solution.

Grzegorz Blach (2):
  package/f2fs-tools: add host package
  fs/f2fs: add support for creating a f2fs image

 DEVELOPERS                        |  1 +
 fs/Config.in                      |  1 +
 fs/f2fs/Config.in                 | 49 +++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.mk                   | 46 +++++++++++++++++++++++++++++
 package/Config.in.host            |  1 +
 package/f2fs-tools/Config.in.host |  7 +++++
 package/f2fs-tools/f2fs-tools.mk  |  2 ++
 7 files changed, 107 insertions(+)
 create mode 100644 fs/f2fs/Config.in
 create mode 100644 fs/f2fs/f2fs.mk
 create mode 100644 package/f2fs-tools/Config.in.host

-- 
2.17.2
