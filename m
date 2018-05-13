From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:39:40 +0200
Subject: [Buildroot] [git commit] libkrb5: disable rpath
Message-ID: <20180513193908.1BC008B421@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35a093a17edc56184a9964ca646bea8ace627b31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default rpath value for krb5 is /usr/lib. On some hosts this might
confuse the build time linker as it looks for target libraries in the
host /usr/lib directory.

Should fix:
http://autobuild.buildroot.net/results/6df/6df84ed325ddd92248741d2f4737423b1b999489/
http://autobuild.buildroot.net/results/049/049f5147288b418402b6e5a4181eff4d426c8d7a/
http://autobuild.buildroot.net/results/432/432d5d0295f77cd34b78e70e8b4b7d77ef19ae3c/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index c40be63278..d9d7160ae8 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -28,7 +28,8 @@ LIBKRB5_CONF_OPTS = \
 	--without-system-et \
 	--without-system-ss \
 	--without-system-verto \
-	--without-tcl
+	--without-tcl \
+	--disable-rpath
 
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 LIBKRB5_CONF_OPTS += --with-ldap
