From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 23:44:20 +0100
Subject: [Buildroot] [git commit] Revert "keepalived: needs headers >= 3.4"
Message-ID: <20201103223140.140078758E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c69a88190a73fae4b300c47182089117f16c8415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit d01b0bbad04b97a5e8e1dd3ac3c1026555f793fb.

Original commit  made restriction for Linux headers < 3.4 which was
related to keepalived version 1.3.5, but it compiles fine now at least
with a toolchain based on 3.2 headers and keepalived 2.0.15 together
with ipset enabled.

Probably it was fixed by this commit:

    https://github.com/acassen/keepalived/commit/5a7f895bb795269f79e6353c6269dfbc0b782281

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keepalived/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index c71821545c..2a0663fed0 100644
--- a/package/keepalived/Config.in
+++ b/package/keepalived/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_KEEPALIVED
 	bool "keepalived"
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # uses libdl
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_OPENSSL
 	help
 	  The main goal of the keepalived project is to add a strong &
@@ -15,6 +14,6 @@ config BR2_PACKAGE_KEEPALIVED
 
 	  http://www.keepalived.org/
 
-comment "keepalived needs a toolchain w/ dynamic library, headers >= 3.4"
+comment "keepalived needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on BR2_STATIC_LIBS
