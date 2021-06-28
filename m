From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 28 Jun 2021 09:16:05 -0700
Subject: [Buildroot] [PATCH 0/5] nginx updates
Message-ID: <20210628161610.3197763-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just some nginx maintnence.

Changes include:
  - Update nginx to the latest LTS release.
  - Update nginx naxsi, dav-ext, and modsecurity.

The nginx-upload package also has updates, however, the current nginx-upload url
points to a fork of nginx-upload-module. The official project URL is fdintino
not vkholodkov. Should this be changed to fdintino and the version changed to
4423994c7d8fb491d95867f6af968585d949e7a9?

Adam

Adam Duskett (5):
  package/nginx: bump version to 1.20.1
  package/nginx: add stream_set_module support
  package/nginx-naxsi: bump version to 1.3
  package/nginx-dav-ext: bump version to 3.0.0
  package/nginx-modsecurity: bump to  version 1.0.2

 package/nginx-dav-ext/nginx-dav-ext.hash      |  4 +-
 package/nginx-dav-ext/nginx-dav-ext.mk        |  2 +-
 .../nginx-modsecurity/nginx-modsecurity.hash  |  6 +--
 .../nginx-modsecurity/nginx-modsecurity.mk    |  2 +-
 package/nginx-naxsi/nginx-naxsi.hash          |  4 +-
 package/nginx-naxsi/nginx-naxsi.mk            |  6 +--
 ...ture_run_force_result-for-each-featu.patch | 40 ++++++++-----------
 ...ake-sys_nerr-guessing-cross-friendly.patch | 27 ++++++-------
 ...to-os-linux-fix-build-with-libxcrypt.patch |  2 +-
 ...ff-by-one-write-in-ngx_resolver_copy.patch | 40 -------------------
 package/nginx/Config.in                       |  6 +++
 package/nginx/nginx.hash                      |  4 +-
 package/nginx/nginx.mk                        |  6 ++-
 13 files changed, 55 insertions(+), 94 deletions(-)
 delete mode 100644 package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch

-- 
2.31.1
