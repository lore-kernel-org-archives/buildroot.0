From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Jul 2014 22:52:30 +0200
Subject: [Buildroot] [git commit] lxc: disable lua and python
Message-ID: <20140706222325.047279D18F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa9a1a8de21839d44316d62bd57a5b4b6474ef80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also conditionally disable bash if bash isn't built. Fixes:
http://autobuild.buildroot.net/results/8ea/8ea1d682706ba5fee27a64008bb7237d53120e9b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/lxc.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index b251b14..abb0a1b 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -11,6 +11,8 @@ LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
 # configure not shipped
 LXC_AUTORECONF = YES
-LXC_CONF_OPT = --disable-apparmor --with-distro=buildroot
+LXC_CONF_OPT = --disable-apparmor --with-distro=buildroot \
+	--disable-lua --disable-python \
+	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
 $(eval $(autotools-package))
