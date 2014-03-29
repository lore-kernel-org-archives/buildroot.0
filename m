From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:28:41 +0100
Subject: [Buildroot] [git commit] libstrophe: needs thread support in
	toolchain
Message-ID: <20140329222900.CE2109C42D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccd78862c3d3ab1b0fdb4bb4e21a54fd57e143b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/210/21072a847ecc682594ed06897fa45f888b562123/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libstrophe/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
index d4e6a7d..ff80532 100644
--- a/package/libstrophe/Config.in
+++ b/package/libstrophe/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSTROPHE
 	bool "libstrophe"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libstrophe is a lightweight XMPP client library written in C.
 	  It has minimal dependencies and is configurable for various
@@ -9,3 +10,6 @@ config BR2_PACKAGE_LIBSTROPHE
 	  based platforms.
 
 	  https://github.com/strophe/libstrophe
+
+comment "libstrophe needs a toolchain w/ threads"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS
