From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 18:03:03 +0200
Subject: [Buildroot] [git commit] libkrb5: disable optional tcl support
Message-ID: <20180404160305.68B9D8123C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f89a6379cdc3348d972a09b7e900d1f51aee77a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoid detection of host tcl headers.

The tcl package in Buildroot is not cross-compile safe. The generated
tclConfig.sh script has -L/usr/lib in TCL_LIB_SPEC.

Should fix:
http://autobuild.buildroot.net/results/d11/d118c3c09f6fc1de26491f2ed480ef28b091dba8/
http://autobuild.buildroot.net/results/035/0353e1443125da1e544d1a98348716bfe67c8726/

Cc: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 88cfc61a19..0390507304 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -25,7 +25,8 @@ LIBKRB5_CONF_OPTS = \
 	--without-system-db \
 	--without-system-et \
 	--without-system-ss \
-	--without-system-verto
+	--without-system-verto \
+	--without-tcl
 
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 LIBKRB5_CONF_OPTS += --with-ldap
