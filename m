From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Oct 2015 16:43:42 +0100
Subject: [Buildroot] [PATCH 3/4] package/dvblast: needs threads
In-Reply-To: <cover.1446219805.git.yann.morin.1998@free.fr>
References: <cover.1446219805.git.yann.morin.1998@free.fr>
Message-ID: <f9ad87dc2c39526c794c35b9f05eb2d354d31639.1446219805.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes;
    http://autobuild.buildroot.org/results/c25/c25143fd1363d162de6733bc55a84289543f4da3/
    http://autobuild.buildroot.org/results/09d/09d9a962b20295d09d7777f873f7bb1c8130dbf1/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julian Scheel <julian@jusst.de>
---
 package/dvblast/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index da78943..1ea8f93 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -4,8 +4,13 @@ config BR2_PACKAGE_DVBLAST
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on !BR2_bfin  # libev
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  DVBlast is a simple and powerful MPEG-2/TS demux and
 	  streaming application.
 
 	  http://www.videolan.org/projects/dvblast.html
+
+comment 'dvblast needs a toolchain w/ threads'
+	depends on !BR2_bfin  # libev
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
