From: ray.kinsella at intel.com <ray.kinsella@intel.com>
Date: Wed, 13 Apr 2016 17:06:42 +0100
Subject: [Buildroot] [PATCH v5] package/radlib: new package
Message-ID: <1460563603-3748-1-git-send-email-ray.kinsella@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ray Kinsella <ray.kinsella@intel.com>

Changes v4 -> v5:
  * reorganize autotools changes into 3 seperate patches
    * adding pkg-config support for sqlite and postgresql 
    * adding mysql-config support for mysql
    * removing ugly CROSS_COMPILE and paths relative to $(prefix)
  * number of small tidy ups for package/radlib

Ray Kinsella (1):
  package/radlib: new package

 package/Config.in                                  |   1 +
 ...oduce-pkg-config-for-sqlite-and-postgresq.patch | 102 +++++++++++++++++++++
 .../0002-radlib-introduce-mysql-config.patch       |  78 ++++++++++++++++
 ...adlib-fix-the-paths-in-the-subdir-objects.patch |  93 +++++++++++++++++++
 package/radlib/Config.in                           |  38 ++++++++
 package/radlib/radlib.hash                         |   2 +
 package/radlib/radlib.mk                           |  28 ++++++
 7 files changed, 342 insertions(+)
 create mode 100644 package/radlib/0001-radlib-introduce-pkg-config-for-sqlite-and-postgresq.patch
 create mode 100644 package/radlib/0002-radlib-introduce-mysql-config.patch
 create mode 100644 package/radlib/0003-radlib-fix-the-paths-in-the-subdir-objects.patch
 create mode 100644 package/radlib/Config.in
 create mode 100644 package/radlib/radlib.hash
 create mode 100644 package/radlib/radlib.mk

-- 
2.4.11
