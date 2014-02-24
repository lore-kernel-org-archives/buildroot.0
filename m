From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 09:03:29 +0100
Subject: [Buildroot] [git commit] sconeserver: missing dependency on
	BR2_USE_MMU
Message-ID: <20140224083843.CD7C39B97B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a270de1e3ac9811ae82c257931b9583b2697035
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE option of sconeserver
selects imagemagick, but forgets to depends on BR2_USE_MMU, which
imagemagick depends on.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index ccb9c00..16b731e 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -31,6 +31,7 @@ config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
 config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
 	bool "http::sconesite::image"
 	depends on BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
+	depends on BR2_USE_MMU # imagemagick
 	select BR2_PACKAGE_IMAGEMAGICK
 	help
 	  http::sconesite::image module for Sconeserver
