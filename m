From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 22:57:09 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: fix consistency warning
	on pthread-stubs option
Message-ID: <20130429205839.578089B8E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d97a09497174cbf6bd67894c361a17c61cbd41e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old BR2_PACKAGE_PTHREAD_STUBS option (kept for legacy support) now
selects the BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS option, but this creates
a consistency warning from kconfig, because the new option has
BR2_PACKAGE_XORG7 as a dependency.

Since the old option also had BR2_PACKAGE_XORG7 has a dependency, we
make the legacy config option depend on BR2_PACKAGE_XORG7 to avoid
this warning.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
