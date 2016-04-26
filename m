From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 22:33:47 +0200
Subject: [Buildroot] [git commit] ipmitool: explicitly enable lanplus when
	selected
Message-ID: <20160426203739.BEFE881E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9db87dce0667802238965e3294ec51a83d4ec93f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipmitool/ipmitool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index f476ae9..60ef2f8 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -15,6 +15,7 @@ IPMITOOL_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
 IPMITOOL_DEPENDENCIES += openssl
+IPMITOOL_CONF_OPTS += --enable-intf-lanplus
 else
 IPMITOOL_CONF_OPTS += --disable-intf-lanplus
 endif
