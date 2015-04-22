From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 23:06:55 +0200
Subject: [Buildroot] [git commit] package infra: drop non-IPv6 support
Message-ID: <20150422210725.4536781D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd4e48386eaf783aca7fd22b774557620c4763a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that IPv6 is mandatory remove support for non-IPv6 tweaks/variables
in the package infra.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in      |    6 ------
 package/pkg-autotools.mk |    2 +-
 2 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index e65e08b..a0c5a7a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -369,12 +369,6 @@ else
 DISABLE_NLS :=--disable-nls
 endif
 
-ifeq ($(BR2_INET_IPV6),y)
-DISABLE_IPV6 = --enable-ipv6
-else
-DISABLE_IPV6 = --disable-ipv6
-endif
-
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 TARGET_CONFIGURE_OPTS += CXX=false
 endif
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 2ecf7d8..49b42d4 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -200,8 +200,8 @@ define $(2)_CONFIGURE_CMDS
 		--with-xmlto=no \
 		--with-fop=no \
 		--disable-dependency-tracking \
+		--enable-ipv6 \
 		$$(DISABLE_NLS) \
-		$$(DISABLE_IPV6) \
 		$$(ENABLE_DEBUG) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
