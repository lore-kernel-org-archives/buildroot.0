From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:55 +0200
Subject: [Buildroot] [PATCH 44/83 v2] package/gstreamer: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <f1a4c31e0318b4d589853aecfec58c96df0052f4.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gstreamer has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes RFC -> v1:
  - fix commit log+title  (Arnout)
  - move later in the series, after we document that 5-or-more
    sub-options require a menuconfig
---
 package/gstreamer/gstreamer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
index aee48b1..cba8774 100644
--- a/package/gstreamer/gstreamer/Config.in
+++ b/package/gstreamer/gstreamer/Config.in
@@ -2,7 +2,7 @@ comment "gstreamer 0.10 needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_GSTREAMER
+menuconfig BR2_PACKAGE_GSTREAMER
 	bool "gstreamer 0.10"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-- 
2.7.4
