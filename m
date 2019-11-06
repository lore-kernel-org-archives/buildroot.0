From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 22:47:20 +0100
Subject: [Buildroot] [git commit] package/lxc: switch optional gnutls
 dependency to openssl
Message-ID: <20191106214033.87D0281208@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1216a141f1bdcd16df2b4635b3659c39137e2f7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lxc switched from gnutls to openssl since version 3.2.0:
https://github.com/lxc/lxc/commit/fa2bb6ba532c5e7f92df8cbae50a68af519f9997

Patch was originally created by Fabrice Fontaine:
http://patchwork.ozlabs.org/patch/1148360/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/lxc.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 6d94c0c735..81adeef5ee 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -19,13 +19,6 @@ ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
 LXC_DEPENDENCIES += bash-completion
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LXC_CONF_OPTS += --enable-gnutls
-LXC_DEPENDENCIES += gnutls
-else
-LXC_CONF_OPTS += --disable-gnutls
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 LXC_CONF_OPTS += --enable-capabilities
 LXC_DEPENDENCIES += libcap
@@ -47,4 +40,11 @@ else
 LXC_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LXC_CONF_OPTS += --enable-openssl
+LXC_DEPENDENCIES += openssl
+else
+LXC_CONF_OPTS += --disable-openssl
+endif
+
 $(eval $(autotools-package))
