From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:59 -0000
Subject: [Buildroot] [git commit branch/next] c-icap: needs MMU support
Message-ID: <20150808105628.82CB880414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58f6b79334ef19fd63f9acaa27486fe8a76f14d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

  http://autobuild.buildroot.org/results/8c3/8c3e397eeecb2a6a39fbae1d8665bff92ef3e3bb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/c-icap/Config.in b/package/c-icap/Config.in
index f949c16..8121a26 100644
--- a/package/c-icap/Config.in
+++ b/package/c-icap/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_C_ICAP
 	bool "c-icap"
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  c-icap is an implementation of an ICAP server. It can be
 	  used with HTTP proxies that support the ICAP protocol to
@@ -13,4 +14,5 @@ config BR2_PACKAGE_C_ICAP
 	  http://c-icap.sourceforge.net/
 
 comment "c-icap needs a toolchain w/ threads and dynamic library"
+	depends on BR2_USE_MMU
 	depends on BR2_PREFER_STATIC_LIB  || !BR2_TOOLCHAIN_HAS_THREADS
