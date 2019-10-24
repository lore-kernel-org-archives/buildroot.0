From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2019 23:27:18 +0200
Subject: [Buildroot] [git commit] package/mobile-broadband-provider-info:
 needs host-libxslt
Message-ID: <20191024212209.AACBA846EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec058dce0fe9698a001bbaa6a7527e4581e1c34d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xsltproc is needed to build apn-conf since version 20190618 and
https://github.com/GNOME/mobile-broadband-provider-info/commit/6dd77065c3beb4aa32218d76ba27efb83d507f42

Fixes:
 - http://autobuild.buildroot.org/results/824c5d67f12fa1a9ce31f2698eae986f14ca69ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../mobile-broadband-provider-info/mobile-broadband-provider-info.mk    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index 5f64f0f35f..2986f92f69 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -10,6 +10,6 @@ MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE_FILES = COPYING
 MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
-MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkgconf
+MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkgconf host-libxslt
 
 $(eval $(autotools-package))
