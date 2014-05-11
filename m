From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 May 2014 20:50:30 +0200
Subject: [Buildroot] [git commit] libeio: needs threads
Message-ID: <20140511185738.274279CB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ed76d5427639987bfdf22ecf2cd10cdea1e8f95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/278/27854bf8425d64dbb475653161bbf1f386173366/

libeio only reverse dependency (enlightenment) depends on
BR2_TOOLCHAIN_HAS_THREADS already.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/libeio/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/efl/libeio/Config.in b/package/efl/libeio/Config.in
index 0b2751c..5b1e395 100644
--- a/package/efl/libeio/Config.in
+++ b/package/efl/libeio/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBEIO
 	select BR2_PACKAGE_LIBEET
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBECORE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Eio integrates with EFL (Ecore, Eina) to provide efficient
 	  filesystem Input/Output (I/O). It use the best techniques to
@@ -16,3 +17,6 @@ config BR2_PACKAGE_LIBEIO
 	  naive implementations, and it is easy to use.
 
 	  http://trac.enlightenment.org/e/wiki/Eio
+
+comment "libeio needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
