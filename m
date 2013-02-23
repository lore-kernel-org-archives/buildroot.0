From: gilles.talis at gmail.com <gilles.talis@gmail.com>
Date: Fri, 22 Feb 2013 22:15:54 -0800
Subject: [Buildroot] [PATCH v2] libmad: force architecture-specific
	optimisations on AVR32
In-Reply-To: <y>
References: <y>
Message-ID: <51285e9f.a7c1440a.5732.6e6b@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gilles Talis <gilles.talis@gmail.com>

Fixes:
http://autobuild.buildroot.net/results/e01f5a5484299dce1797966445f3972583c67b22
http://autobuild.buildroot.net/results/7ed0563fbbfc19c93ec5be35d3b6a95e496b4c5d

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libmad/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index d0edc49..80ed853 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBMAD
 	bool "libmad"
+	select BR2_PACKAGE_LIBMAD_ASO if BR2_avr32
 	help
 	  High-quality MPEG audio decoder.  All computations are performed
 	  with fixed-point integer arithmetic, making it ideal for systems
-- 
1.7.10.4
