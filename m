From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:26:51 +0200
Subject: [Buildroot] [git commit] samba4: depend on host-nfs-utils
Message-ID: <20180527213342.874BC8284A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60fc73adc72b9faa3b52599efc69213dd1f0172c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-nfs-utils provides the host rpcgen utility. This fixes the build on
recent Fedora systems that removed rpcgen from the glibc package.

Fixes:
http://autobuild.buildroot.net/results/6f8/6f869b8c7c182dfe7f1a291b5952320504540ebf/
http://autobuild.buildroot.net/results/4c2/4c228dd6369e4fc11b798af6ab2abe06d7473b78/
http://autobuild.buildroot.net/results/489/489be441abd19fba2b0c39357e64a6adcf773b60/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c77bc04a89..b03af34cd0 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -11,7 +11,7 @@ SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = \
-	host-e2fsprogs host-heimdal host-python \
+	host-e2fsprogs host-heimdal host-python host-nfs-utils \
 	e2fsprogs popt python zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
