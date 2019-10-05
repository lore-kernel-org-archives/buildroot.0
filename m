From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri,  4 Oct 2019 23:42:28 -0300
Subject: [Buildroot] [PATCH 0/2] package/cups-filters: drop useless hook and
 fix build
Message-ID: <20191005024230.25287-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Patch 1 drops the pre-configure hook that became unnecessary after the
upgrade to version 1.25.6.

Patch 2 fixes the build on old Linux distributions, which got broken
because the ln-srf script that was not included in the 1.25.6 release
tarball.

Carlos Santos (2):
  package/cups-filters: drop pre-configure hook
  package/cups-filters: fix ln -r workaround for older distributions

 ...ild-system-add-missing-ln-srf-script.patch | 71 +++++++++++++++++++
 package/cups-filters/cups-filters.mk          | 11 +--
 2 files changed, 77 insertions(+), 5 deletions(-)
 create mode 100644 package/cups-filters/0001-Build-system-add-missing-ln-srf-script.patch

-- 
2.18.1
