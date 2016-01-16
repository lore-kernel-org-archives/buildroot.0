From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:52 +0100
Subject: [Buildroot] [PATCH 60/80 v1] package/ndisc6: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <35af9a33faa4808e8e5b68bc58bc4a1b009c3090.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ndisc6 has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ndisc6/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 321bfbc..966ec91 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_NDISC6
+menuconfig BR2_PACKAGE_NDISC6
 	bool "ndisc6 tools"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-- 
1.9.1
