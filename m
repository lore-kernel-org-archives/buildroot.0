From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:25:06 +0200
Subject: [Buildroot] [git commit] collectd: drop rrdtool selects
Message-ID: <20151009132509.C5DE3817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c1a1c15ad17a6345d2e7df722b40179c552d2ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop indirect rrdtool selects, they're already selected by rrdtool
itself so there's no need.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 2054978..5cdb24e 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -504,11 +504,7 @@ config BR2_PACKAGE_COLLECTD_NETWORK
 config BR2_PACKAGE_COLLECTD_RRDTOOL
 	bool "rrdtool"
 	depends on BR2_USE_WCHAR # rrdtool
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LIBART
-	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_RRDTOOL
-	select BR2_PACKAGE_ZLIB
 	help
 	  Writes values to RRD-files.
 
