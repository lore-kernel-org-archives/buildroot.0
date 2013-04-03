From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Apr 2013 22:43:46 +0200
Subject: [Buildroot] [git commit] linknx: needs mmu
Message-ID: <20130403204841.EA0E69B468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e853215eaae4cdef22720e9ee317a02b756fc3af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Inherited from libpthsem which uses fork()

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linknx/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 18e9867..f35351e 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LINKNX
 	bool "linknx"
 	select BR2_PACKAGE_LIBPTHSEM
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # libpthsem
 	help
 	  Linknx is an automation platform providing high level functionalities
 	  to EIB/KNX installation.
