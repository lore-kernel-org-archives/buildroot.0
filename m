From: Romain Naour <romain.naour@smile.fr>
Date: Wed,  5 Jul 2017 01:08:57 +0200
Subject: [Buildroot] [PATCH 3/3] package/kvazaar: needs
	BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20170704230857.7916-1-romain.naour@smile.fr>
References: <20170704230857.7916-1-romain.naour@smile.fr>
Message-ID: <20170704230857.7916-3-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

./.libs/libkvazaar.so: undefined reference to `__sync_add_and_fetch_4'

Fixes:
http://autobuild.buildroot.net/results/b39/b39a82a2e4106c5ec55c288415e73043a872a0b1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/kvazaar/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kvazaar/Config.in b/package/kvazaar/Config.in
index de2c6c9..fb97369 100644
--- a/package/kvazaar/Config.in
+++ b/package/kvazaar/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_KVAZAAR
 	bool "kvazaar"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  An open-source HEVC encoder licensed under LGPLv2.1
 
 	  https://github.com/ultravideo/kvazaar
 
 comment "kvazaar needs a toolchain w/ C++, threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.9.4
