From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 23:36:35 +0200
Subject: [Buildroot] [PATCH] cosmo: disable package until upstream site is
	fixed
Message-ID: <1402608995-762-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/1ca/1ca98e95b106a948f1c0d0153a290ae1d9adb76d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cosmo/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cosmo/Config.in b/package/cosmo/Config.in
index cf5e123..869a107 100644
--- a/package/cosmo/Config.in
+++ b/package/cosmo/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_COSMO
 	bool "cosmo"
 	# run-time dependency
 	select BR2_PACKAGE_LPEG
+	# upstream site does not provide a valid archive
+	depends on BROKEN
 	help
 	  Cosmo is a "safe templates" engine for Lua.
 
-- 
2.0.0
