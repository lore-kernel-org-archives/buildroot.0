From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 21:53:16 +0200
Subject: [Buildroot] [git commit] package/lxc: disable examples
Message-ID: <20200714200033.2FE4F86D0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27f1995d9374faf66e2b965a16523b775589bcf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lxc/lxc.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 53e3c85c6d..7994dffcf5 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -13,7 +13,10 @@ LXC_INSTALL_STAGING = YES
 # We're patching configure.ac
 LXC_AUTORECONF = YES
 
-LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
+LXC_CONF_OPTS = \
+	--disable-apparmor \
+	--disable-examples \
+	--with-distro=buildroot \
 	--disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
