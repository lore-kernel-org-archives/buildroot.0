From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 23:44:48 +0100
Subject: [Buildroot] [git commit] infra: remove separate definition of
	DISABLE_DOCUMENTATION
Message-ID: <20140208224725.7F24C9B985@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e20df632c4cd717061ae8176a5c34181c671baee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we now always disable documentation on target, there is no need to
have a separate variable DISABLE_DOCUMENTATION anymore.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in      |   10 ----------
 package/pkg-autotools.mk |    7 ++++++-
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a8f5650..9d0e7d6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -332,16 +332,6 @@ ifneq ($(BR2_LARGEFILE),y)
 DISABLE_LARGEFILE= --disable-largefile
 endif
 
-# The configure option varies, but since unknown options are ignored
-# we can pass all of them.
-DISABLE_DOCUMENTATION = \
-	--disable-gtk-doc \
-	--disable-doc \
-	--disable-docs \
-	--disable-documentation \
-	--with-xmlto=no \
-	--with-fop=no
-
 ifeq ($(BR2_INET_IPV6),y)
 DISABLE_IPV6= --enable-ipv6
 else
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index cfbdc27..6f52335 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -109,7 +109,12 @@ define $(2)_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--program-prefix="" \
-		$$(DISABLE_DOCUMENTATION) \
+		--disable-gtk-doc \
+		--disable-doc \
+		--disable-docs \
+		--disable-documentation \
+		--with-xmlto=no \
+		--with-fop=no
 		$$(DISABLE_NLS) \
 		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
