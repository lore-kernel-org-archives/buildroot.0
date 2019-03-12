From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 22:28:29 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: fix host gcc >= 4.8
 check
Message-ID: <20190312212537.DE7F28EC4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7aafaadc4247144af21f2e035ef72e3d8b001ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need host gcc >= 4.8 not host gcc < 4.8.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: James Hilliard &lt;<a href="mailto:james.hilliard1@gmail.com" target="_blank">james.hilliard1 at gmail.com</a>&gt;<br></blockquote><div><br></div><div><span class="gmail-m_4107183884095209747gmail-il"><span class="gmail-il">Acked</span></span>-by: Francois Perrad &lt;<a href="mailto:francois.perrad@gadz.org" target="_blank">francois.perrad at gadz.org</a>&gt;</div><div> <br></div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 64e81a95f9..04ebe5452b 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -33,7 +33,7 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_HOST_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
 
 comment "wpewebkit needs an OpenGL ES w/ EGL backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
