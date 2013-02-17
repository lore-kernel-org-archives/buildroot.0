From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Feb 2013 00:22:30 +0100
Subject: [Buildroot] [PATCH 4/6] package/vtun: add missing 'depends on' zlib
In-Reply-To: <cover.1361143078.git.yann.morin.1998@free.fr>
References: <cover.1361143078.git.yann.morin.1998@free.fr>
Message-ID: <c50b0393e678604e8c52b349a6d081307ee9481c.1361143078.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency on zlib is correctly expresed in vtun.mk,
but was missing from the Config.in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/vtun/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index b40de25..7afda9e 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VTUN
 	bool "vtun - BEWARE: read package/vtun/README.txt before use"
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
 	  with traffic shaping, compression, and encryption.
-- 
1.7.2.5
