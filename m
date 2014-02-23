From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2014 00:40:48 +0100
Subject: [Buildroot] [PATCH 01/13] package/linux-headers: remove 2.6 snapshot
In-Reply-To: <cover.1393198603.git.yann.morin.1998@free.fr>
References: <cover.1393198603.git.yann.morin.1998@free.fr>
Message-ID: <3e7506441035369b0fbbaca721511b4973c61a41.1393198603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

As Thomas states:
    It is completely weird to ask the tarball to be named exactly
    linux-2.6.tar.bz2. IMO, we should simply get rid of this feature.

Make it so! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 134e338..fcecd62 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -56,9 +56,6 @@ choice
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
-
-	config BR2_KERNEL_HEADERS_SNAP
-		bool "Local Linux snapshot (linux-2.6.tar.bz2)"
 endchoice
 
 config BR2_DEFAULT_KERNEL_VERSION
@@ -81,5 +78,4 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.13"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.5"	if BR2_KERNEL_HEADERS_3_13
-	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.3.2
