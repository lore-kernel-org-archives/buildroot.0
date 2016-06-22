From: Jordan Yelloz <jordan@yelloz.me>
Date: Wed, 22 Jun 2016 14:01:25 -0700
Subject: [Buildroot] [PATCH 2/2] swupdate: updated help of INSTALL_WEBSITE
	config
In-Reply-To: <20160622210125.18930-1-jordan@yelloz.me>
References: <20160622210125.18930-1-jordan@yelloz.me>
Message-ID: <20160622210125.18930-3-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some explanation was added about how to use the new configuration option
and how to properly run the swupdate website using the package-installed
website data.

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/swupdate/Config.in | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index bc90a2f..7896b84 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -46,11 +46,16 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	bool "install default website"
 	default y
 	help
-	  Install the provided website to /var/www/swupdate.
+	  Install the provided website.
 
-	  This is necessary if you want to run swupdate with the embedded
-	  webserver and do not provide an own website to be installed to
-	  /var/www/swupdate.
+	  This is necessary if you want to run swupdate with the embedded webserver
+	  and do not provide a custom website to be installed in your rootfs.
+
+	  You can customize the installation path of the static website data with
+	  the symbol BR2_PACKAGE_SWUPDATE_WEBSITE_PATH and add that as an option to
+	  the mongoose server when running swupdate using an invocation similar to:
+
+	  swupdate -w '-document_root /var/www/swupdate'
 
 if BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 
-- 
2.9.0
