From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  5 Jul 2014 20:34:01 -0300
Subject: [Buildroot] [PATCH] lxc: disable lua and python
Message-ID: <1404603241-20187-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also conditionally disable bash if bash isn't built. Fixes:
http://autobuild.buildroot.net/results/8ea/8ea1d682706ba5fee27a64008bb7237d53120e9b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lxc/lxc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
1.8.5.5
