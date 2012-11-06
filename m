From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:17 +0100
Subject: [Buildroot] [git commit] samba: unconditionally enable
	--with-sys-quotas
Message-ID: <20121106072427.9AB0799BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2b3a19896b83da34e5ee8a30572dc846141f0cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contrary to what was written in samba.mk, the sys-quotas option
apparently does not depend on RPC support in the toolchain: Samba
builds perfectly fine on an uClibc toolchain without RPC support with
sys-quotas enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index dec60d0..4f87917 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -51,7 +51,7 @@ SAMBA_CONF_OPT = \
 	\
 	--without-cluster-support \
 	--without-dnsupdate \
-	$(if $(BR2_TOOLCHAIN_HAS_NATIVE_RPC),--with-sys-quotas,--without-sys-quotas) \
+	--with-sys-quotas \
 	--without-ads \
 	--without-ldap \
 	--with-included-iniparser \
