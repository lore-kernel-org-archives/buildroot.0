From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2016 23:17:29 +0200
Subject: [Buildroot] [git commit] nginx-upload: depends on
	BR2_PACKAGE_NGINX_HTTP
Message-ID: <20160719211744.EC108817CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62a69249c27e2c9e1bde676848ea85e20a94bdf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/64b1bde02346ca67b670f0b095bd3acad707e8cd

Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: use depends on rather than select.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx-upload/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-upload/Config.in b/package/nginx-upload/Config.in
index b4ee71c..6bc1c3d 100644
--- a/package/nginx-upload/Config.in
+++ b/package/nginx-upload/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGINX_UPLOAD
 	bool "nginx-upload"
+	depends on BR2_PACKAGE_NGINX_HTTP
 	select BR2_PACKAGE_OPENSSL
 	help
 	  A module for nginx web server for handling file uploads
