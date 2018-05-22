From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 May 2018 13:30:15 +0300
Subject: [Buildroot] [PATCH v2 4/6] samba4: depend on host-nfs-utils
In-Reply-To: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
References: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
Message-ID: <f186c4aa429ed22a392bc87da63df040d04d9378.1526985017.git.baruch@tkos.co.il>
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
v2: no change
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
