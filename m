From: Daniel Price <daniel.price@gmail.com>
Date: Thu, 14 Feb 2013 17:05:48 -0800
Subject: [Buildroot] [PATCH 1/2] Add bzip2 to host-python when it is
 selected (aids in compiling nodejs)
Message-ID: <CAKduhStasUzEq99Dfb9mF8DEKuTPc4cjaXKA1T+sMzaj7-CDEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based off of patches posted by (and Signed-off-by): Jonathan Liu
<net147@gmail.com>

Signed-off-by: Daniel Price <daniel.price@gmail.com>
---
 package/python/python.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 71591b7..580eda2 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -30,7 +30,6 @@ HOST_PYTHON_CONF_OPT += \
  --disable-gdbm \
  --disable-bsddb \
  --disable-test-modules \
- --disable-bz2 \
  --disable-ssl

 HOST_PYTHON_MAKE_ENV = \
@@ -98,6 +97,8 @@ endif

 ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
 PYTHON_DEPENDENCIES += bzip2
+HOST_PYTHON_DEPENDENCIES += host-bzip2
+PYTHON_CONF_OPT += --enable-bz2
 else
 PYTHON_CONF_OPT += --disable-bz2
 endif
--
1.7.6.5
