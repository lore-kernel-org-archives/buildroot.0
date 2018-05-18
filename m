From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 18 May 2018 14:31:58 +0300
Subject: [Buildroot] [PATCH 3/4] samba4: depend on host-nfs-utils
In-Reply-To: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
Message-ID: <be167a061f05c8d86828d2b6f556fa6ed29ce54e.1526643119.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-nfs-utils provides the host rpcgen utility. This fixes the build on
recent Fedora systems that removed rpcgen from the glibc package.

Fixes:
http://autobuild.buildroot.net/results/6f8/6f869b8c7c182dfe7f1a291b5952320504540ebf/
http://autobuild.buildroot.net/results/4c2/4c228dd6369e4fc11b798af6ab2abe06d7473b78/
http://autobuild.buildroot.net/results/489/489be441abd19fba2b0c39357e64a6adcf773b60/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c77bc04a89fe..b03af34cd045 100644
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
-- 
2.17.0
