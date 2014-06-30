From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jun 2014 13:43:27 +0200
Subject: [Buildroot] [git commit] blackbox: deprecate package due to dead
	upstream
Message-ID: <20140630120027.9C8419D122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c1ff84efc5d3903500c32713a23dceee00b6cc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There has been no Blackbox release since 2005, which indicates that
the upstream project is dead. Since there are many other maintained
and alive window manager projects around, I'd like to nominate
Blackbox for deprecation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/blackbox/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index e908655..8b61c73 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_BLACKBOX
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
+	# upstream dead since 2005
+	depends on BR2_DEPRECATED_SINCE_2014_08
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
