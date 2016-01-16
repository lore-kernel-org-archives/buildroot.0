From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:40 +0100
Subject: [Buildroot] [PATCH 48/80 v1] package/gstreamer1: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <c9075412f53b23142913e5cb8c3a5683db3354b7.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gstreamer1 has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes RFC -> v1:
  - fix commit log+title  (Arnout)
  - move later in the series, after we document that 5-or-more
    sub-options require a menuconfig
---
 package/gstreamer1/gstreamer1/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index fff8794..a391324 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -2,7 +2,7 @@ comment "gstreamer 1.x needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_GSTREAMER1
+menuconfig BR2_PACKAGE_GSTREAMER1
 	bool "gstreamer 1.x"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-- 
1.9.1
