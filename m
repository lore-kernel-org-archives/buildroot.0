From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu,  9 Apr 2015 12:19:01 +0200
Subject: [Buildroot] [PATCH 0/2] fix pulseview build failures
Message-ID: <1428574743-32177-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes pulseview build failures which have been observed
on many autobuilders. They have been caused by doxygen not being present
on host machines.

The first patch adds doxygen host package. The second makes libsigrok
depend on it when C++ bindings are selected.

Bartosz Golaszewski (2):
  doxygen: new package
  libsigrok: add host-doxygen dependency for C++ bindings

 package/doxygen/doxygen.hash   |  2 ++
 package/doxygen/doxygen.mk     | 18 ++++++++++++++++++
 package/libsigrok/libsigrok.mk |  2 +-
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 package/doxygen/doxygen.hash
 create mode 100644 package/doxygen/doxygen.mk

-- 
2.1.4
