From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 10 Apr 2015 10:16:03 +0200
Subject: [Buildroot] [PATCH v2 0/3] fix pulseview build failures
Message-ID: <1428653766-22734-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes pulseview build failures which have been observed
on many autobuilders. They have been caused by doxygen not being present
on host machines.

The first patch adds doxygen host package. The second makes libsigrok
depend on it when C++ bindings are selected. When that is fixed we
can finally revert the patch marking libsigrokcxx as broken.

v2:
- use host-generic-package instead of host-autotools-package
- revert commit 41e81b7

v1:
http://lists.busybox.net/pipermail/buildroot/2015-April/124714.html

Bartosz Golaszewski (3):
  doxygen: new package
  libsigrok: add host-doxygen dependency for C++ bindings
  Revert "libsigrok: mark libsigrokcxx as broken"

 package/doxygen/doxygen.hash   |  2 ++
 package/doxygen/doxygen.mk     | 25 +++++++++++++++++++++++++
 package/libsigrok/Config.in    |  3 ---
 package/libsigrok/libsigrok.mk |  2 +-
 package/pulseview/Config.in    |  2 --
 5 files changed, 28 insertions(+), 6 deletions(-)
 create mode 100644 package/doxygen/doxygen.hash
 create mode 100644 package/doxygen/doxygen.mk

-- 
2.1.4
