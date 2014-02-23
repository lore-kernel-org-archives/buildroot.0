From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 23:58:11 +0100
Subject: [Buildroot] [PATCH 7/7] sconeserver: missing dependency on
	BR2_USE_MMU
In-Reply-To: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393196291-12636-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE option of sconeserver
selects imagemagick, but forgets to depends on BR2_USE_MMU, which
imagemagick depends on.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sconeserver/Config.in | 1 +
 1 file changed, 1 insertion(+)

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
-- 
1.8.3.2
