From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 23:09:44 +0100
Subject: [Buildroot] [git commit] libvncserver: gnutls support needs gcrypt
	as well
Message-ID: <20130205221001.17A0D9A0BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd88dae7e667c5ef8ef4c3fa2e5c65568efbf2e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/3b479b8cf751cc0c075ab942b56aad36f79ada71

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libvncserver/libvncserver.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 011b174..550abc4 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -31,7 +31,7 @@ else
 LIBVNCSERVER_CONF_OPT += --without-gcrypt
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
+ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
 LIBVNCSERVER_DEPENDENCIES += gnutls host-pkgconf
 else
 LIBVNCSERVER_CONF_OPT += --without-gnutls
