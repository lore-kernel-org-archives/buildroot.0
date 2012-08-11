From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 19:40:48 +0200
Subject: [Buildroot] [PATCH 16/20] samba: unconditionally enable
	--with-sys-quotas
In-Reply-To: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9c123718be706971947840c24f3e5b62bd278f3a.1344706801.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contrary to what was written in samba.mk, the sys-quotas option
apparently does not depend on RPC support in the toolchain: Samba
builds perfectly fine on an uClibc toolchain without RPC support with
sys-quotas enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/samba.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 75f16f5..086462b 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -49,7 +49,7 @@ SAMBA_CONF_OPT = \
 	\
 	--without-cluster-support \
 	--without-dnsupdate \
-	$(if $(BR2_TOOLCHAIN_HAS_NATIVE_RPC),--with-sys-quotas,--without-sys-quotas) \
+	--with-sys-quotas \
 	--without-ads \
 	--without-ldap \
 	--with-included-iniparser \
-- 
1.7.9.5
