From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Apr 2013 22:29:34 +0200
Subject: [Buildroot] [PATCH 4/4] Config.in.legacy: fix consistency warning
	on pthread-stubs option
In-Reply-To: <1367267374-7512-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1367267374-7512-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1367267374-7512-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old BR2_PACKAGE_PTHREAD_STUBS option (kept for legacy support) now
selects the BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS option, but this creates
a consistency warning from kconfig, because the new option has
BR2_PACKAGE_XORG7 as a dependency.

Since the old option also had BR2_PACKAGE_XORG7 has a dependency, we
make the legacy config option depend on BR2_PACKAGE_XORG7 to avoid
this warning.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5165138..fc9f68f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -140,6 +140,7 @@ config BR2_PACKAGE_PTHREAD_STUBS
 	bool "pthread-stubs option has been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
+	depends on BR2_PACKAGE_XORG7
 	help
 	  For consistency reason, the pthread-stubs package has been
 	  renamed to xlib_libpthread-stubs.
-- 
1.7.9.5
