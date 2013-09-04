From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Sep 2013 10:54:20 +0200
Subject: [Buildroot] [git commit] kmod: explicitly define host-kmod
	dependencies
Message-ID: <20130904085538.563E59B6B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fac638d2ff0877b44720e72b0ace522280822982
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So we don't end up pulling in host-busybox (which doesn't exist) if
KMOD_TOOLS is enabled.

Reported-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 9ac7731..169fca3 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -9,6 +9,7 @@ KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
+HOST_KMOD_DEPENDENCIES = host-pkgconf
 
 # Some patches are touching configure.ac
 KMOD_AUTORECONF = YES
