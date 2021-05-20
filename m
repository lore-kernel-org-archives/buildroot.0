From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 May 2021 10:46:38 -0700
Subject: [Buildroot] [PATCH/NEXT: 00/11] selinux packages: bump versions
Message-ID: <20210520174649.1188340-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The selinux project also now uses the respective package versions for the
release URL's, so we change that as well.

Adam Duskett (11):
  package/libsepol: bump to version 3.2
  package/libsepol/Config.in: Add policy version 33
  package/libsemanage: bump to version 3.2
  package/libselinux: bump to version 3.2
  package/policycoreutils: bump to version 3.2
  package/checkpolicy: bump to version 3.2
  package/restorecond: bump to version 3.2
  package/semodule-utils: bump to version 3.2
  package/selinux-python: bump to version 3.2
  package/setools: bump to version 4.4.0
  package/audit: bump to version 3.0.1

 ...0001-Fix-audispd-path-in-auditd.conf.patch |  32 -----
 ...tue-functions-for-strndupa-rawmemchr.patch | 133 ------------------
 ...ns-need-to-be-external-when-building.patch |  28 ----
 package/audit/audit.hash                      |   6 +-
 package/audit/audit.mk                        |   2 +-
 package/checkpolicy/checkpolicy.hash          |   2 +-
 package/checkpolicy/checkpolicy.mk            |   4 +-
 ...T-and-rely-on-the-installed-file-nam.patch |   2 +-
 ...d-to-something-which-never-conflicts.patch |  71 ----------
 package/libselinux/libselinux.hash            |   2 +-
 package/libselinux/libselinux.mk              |   4 +-
 package/libsemanage/libsemanage.hash          |   2 +-
 package/libsemanage/libsemanage.mk            |   4 +-
 package/libsepol/Config.in                    |   4 +-
 package/libsepol/libsepol.hash                |   4 +-
 package/libsepol/libsepol.mk                  |   4 +-
 ...-all-paths-that-use-an-absolute-path.patch |  11 +-
 .../0002-Add-PREFIX-to-host-paths.patch       |  36 +++--
 package/policycoreutils/policycoreutils.hash  |   2 +-
 package/policycoreutils/policycoreutils.mk    |   6 +-
 package/restorecond/restorecond.hash          |   2 +-
 package/restorecond/restorecond.mk            |   4 +-
 package/selinux-python/selinux-python.hash    |   2 +-
 package/selinux-python/selinux-python.mk      |   4 +-
 package/semodule-utils/semodule-utils.hash    |   2 +-
 package/semodule-utils/semodule-utils.mk      |   4 +-
 ...-setools.InfoFlowAnalysis-and-setoo.patch} |  19 +--
 .../0001-remove-werror-flag-from-setup.patch  |  31 ----
 package/setools/setools.hash                  |   2 +-
 package/setools/setools.mk                    |   2 +-
 30 files changed, 69 insertions(+), 362 deletions(-)
 delete mode 100644 package/audit/0001-Fix-audispd-path-in-auditd.conf.patch
 delete mode 100644 package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
 delete mode 100644 package/audit/0003-Header-definitions-need-to-be-external-when-building.patch
 delete mode 100644 package/libselinux/0003-libselinux-rename-gettid-to-something-which-never-conflicts.patch
 rename package/setools/{0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch => 0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch} (88%)
 delete mode 100644 package/setools/0001-remove-werror-flag-from-setup.patch

-- 
2.31.1
