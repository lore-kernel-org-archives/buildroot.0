From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 26 Jun 2016 18:39:07 -0400
Subject: [Buildroot] [PATCH v6 0/6] *** Update selinux libraries ***
Message-ID: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many of the packages in buildroot pertaining to selinux are woefully
out of date.  This patch series focuses on bringing these packages
up to date with the current releases.

Adam Duskett (6):
  audit: bump to version 2.6
  libsemanage: bump to version 2.5
  checkpolicy: bump to version 2.5
  libselinux: bump to version 2.5
  libsepol: bump to version 2.5
  setools: fix build with latest selinux libraries.

 package/audit/audit.hash                           |  2 +-
 package/audit/audit.mk                             |  2 +-
 package/checkpolicy/checkpolicy.hash               |  2 +-
 package/checkpolicy/checkpolicy.mk                 |  4 +-
 package/libselinux/libselinux.hash                 |  2 +-
 package/libselinux/libselinux.mk                   |  6 +-
 .../libsemanage/0001-execption-lib-path-fix.patch  | 14 ----
 .../0001-workaround-blackfin-issue.patch           | 25 ++++++
 .../0002-workaround-blackfin-issue.patch           | 24 ------
 package/libsemanage/libsemanage.hash               |  2 +-
 package/libsemanage/libsemanage.mk                 |  6 +-
 package/libsepol/0001-support-static-only.patch    | 26 +++----
 .../libsepol/0002-workaround-blackfin-issue.patch  |  8 +-
 package/libsepol/libsepol.hash                     |  2 +-
 package/libsepol/libsepol.mk                       |  4 +-
 ...s-Update-for-2015-02-02-Userspace-release.patch | 90 ++++++++++++++++++++++
 16 files changed, 150 insertions(+), 69 deletions(-)
 delete mode 100644 package/libsemanage/0001-execption-lib-path-fix.patch
 create mode 100644 package/libsemanage/0001-workaround-blackfin-issue.patch
 delete mode 100644 package/libsemanage/0002-workaround-blackfin-issue.patch
 create mode 100644 package/setools/0003-setools-Update-for-2015-02-02-Userspace-release.patch

-- 
2.7.4
