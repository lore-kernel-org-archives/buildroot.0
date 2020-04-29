From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2020 23:33:22 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mc: add optional
 dependency to gmp
Message-ID: <20200429213633.99C9F90B58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd635c862b6d1ac7b761aa56ae2725ff2b6a0db4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9cae8f557b9d3f18ccf3694155f452d6b55de5f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mc/mc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 24f6ac36ac..52b3a4b48f 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -11,6 +11,13 @@ MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf
 
+ifeq ($(BR2_PACKAGE_GMP),y)
+MC_CONF_OPTS += --with-gpm-mouse
+MC_DEPENDENCIES += gpm
+else
+MC_CONF_OPTS += --without-gpm-mouse
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 MC_CONF_OPTS += --enable-vfs-sftp
 MC_DEPENDENCIES += libssh2
