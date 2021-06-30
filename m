From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 30 Jun 2021 10:36:55 -0700
Subject: [Buildroot] [PATCH v2 0/5] nginx updates
Message-ID: <20210630173700.30975-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the feedback!
Yann; I updated the license information for nginx-naxsi and added pcre as a
dependency (it was already selected.)

I also dropped the ignore_cve's from nginx.mk.

Adam Duskett (5):
  package/nginx: bump version to 1.20.1
  package/nginx: add stream_set_module support
  package/nginx-naxsi: bump version to 1.3
  package/nginx-dav-ext: bump version to 3.0.0
  package/nginx-modsecurity: bump to version 1.0.2

 package/nginx-dav-ext/nginx-dav-ext.hash      |  4 +-
 package/nginx-dav-ext/nginx-dav-ext.mk        |  2 +-
 .../nginx-modsecurity/nginx-modsecurity.hash  |  6 +--
 .../nginx-modsecurity/nginx-modsecurity.mk    |  2 +-
 package/nginx-naxsi/nginx-naxsi.hash          |  5 ++-
 package/nginx-naxsi/nginx-naxsi.mk            |  8 ++--
 ...ture_run_force_result-for-each-featu.patch | 40 ++++++++-----------
 ...ake-sys_nerr-guessing-cross-friendly.patch | 27 ++++++-------
 ...to-os-linux-fix-build-with-libxcrypt.patch |  2 +-
 ...ff-by-one-write-in-ngx_resolver_copy.patch | 40 -------------------
 package/nginx/Config.in                       |  6 +++
 package/nginx/nginx.hash                      |  4 +-
 package/nginx/nginx.mk                        |  9 +++--
 13 files changed, 58 insertions(+), 97 deletions(-)
 delete mode 100644 package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch

-- 
2.31.1
