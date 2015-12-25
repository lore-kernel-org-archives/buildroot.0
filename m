From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:32 +0100
Subject: [Buildroot] [PATCH 63/84 RFC] package/dovecot: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <3e972f839c28c0bcfb7ca6c2cc4dee23ccaeec87.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dovecot has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dovecot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 3baae6e..5b35286 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_DOVECOT
+menuconfig BR2_PACKAGE_DOVECOT
 	bool "dovecot"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
-- 
1.9.1
