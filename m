From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 18:18:36 +0100
Subject: [Buildroot] [git commit] samba4: add optional libbsd dependency
Message-ID: <20160213171853.9064F7F97F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59e69990867beb06c128060726bd65247ddea0f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's used for some small functions like md5 support, non-essential since
samba has an internal fallback for those, but still add it for
predictability.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4e796a6..118a4ae 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -11,6 +11,7 @@ SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPLv3+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
+	$(if $(BR2_PACKAGE_LIBBSD),libbsd) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline)
 
