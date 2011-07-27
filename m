From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Jul 2011 11:56:53 +0200
Subject: [Buildroot] [git commit] util-linux: misc fixes
Message-ID: <20110727095826.6C70D8B4FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=213bbe9a2281f47eb1f602c041fd91133b662c35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- We patch configure.ac, so we need to autoreconf
- configure uses pkg-config, so ensure the cross version is used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/util-linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a63055a..c01a4ff 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,6 +7,8 @@ UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_VERSION_MAJOR = 2.19
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_AUTORECONF = YES
+UTIL_LINUX_DEPENDENCIES = host-pkg-config
 
 UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
 
-- 
1.7.3.4
