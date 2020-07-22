From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:00:59 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/lxc: disable
 examples
Message-ID: <20200722065809.986D387E9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61a4e6b98ddb27b82ddbe802ec9032caa955d8c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 27f1995d9374faf66e2b965a16523b775589bcf5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
