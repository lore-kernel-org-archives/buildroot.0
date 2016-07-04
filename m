From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:05 +0200
Subject: [Buildroot] [PATCH 54/83 v2] package/lldpd: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <c7d494a7a7ab2e9a817c690b782a37e2280ae00a.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lldpd has 5-or-more options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/lldpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lldpd/Config.in b/package/lldpd/Config.in
index 9a9517b..a1ffc54 100644
--- a/package/lldpd/Config.in
+++ b/package/lldpd/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LLDPD
+menuconfig BR2_PACKAGE_LLDPD
 	bool "lldpd"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEVENT
-- 
2.7.4
