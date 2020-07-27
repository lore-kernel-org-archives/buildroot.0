From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 17:22:07 +0200
Subject: [Buildroot] [git commit] package/lz4: don't install programs by
 default
Message-ID: <20200727151939.6089389051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=739eda1990f94955a5289cafaa7fedfe830e2b9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2acb27e298c54935f890111fc5897a11350b913b ("package/lz4: make
program installation optional") make the installation of the lz4
programs optional. To preserve backward compatibility, this commit
added a "default y" to the BR2_PACKAGE_LZ4_PROGS.

While Buildroot definitely tries to preserve backward compatibility in
general, in this case, the backward compatibility would mean that
everbody would by default install those 220 KB of program, which are
most likely not needed for the majority of use cases. Installaing them
by default kind of breaks the Buildroot principle of minimalism.

In this specific case, it is believed that the principle of minimalism
wins over the principle of backward compatibility.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lz4/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/lz4/Config.in b/package/lz4/Config.in
index dbe3f2e243..06a4e93dc1 100644
--- a/package/lz4/Config.in
+++ b/package/lz4/Config.in
@@ -13,7 +13,6 @@ if BR2_PACKAGE_LZ4
 
 config BR2_PACKAGE_LZ4_PROGS
 	bool "install programs"
-	default y
 	help
 	  lz4, lz4c, unlz4 and lz4cat binaries
 
