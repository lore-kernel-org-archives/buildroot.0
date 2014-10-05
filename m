From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 18:01:16 +0200
Subject: [Buildroot] [git commit] package/apr-util: Add comment to describe
	toolchain dependencies
Message-ID: <20141005160134.1AFD0B09B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99c4a8354f0a8aef0bae5280fcd48738cd7f3084
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr-util/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 3d4ec23..fcef693 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -12,3 +12,7 @@ config BR2_PACKAGE_APR_UTIL
 	  The utility library for the apache runtime project
 
 	  http://apr.apache.org/
+
+comment "apr-util needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB
