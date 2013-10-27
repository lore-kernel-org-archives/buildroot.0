From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 27 Oct 2013 19:54:19 -0300
Subject: [Buildroot] [PATCH 3/3] alsamixergui: needs mmu
In-Reply-To: <1382914459-30545-1-git-send-email-gustavo@zacarias.com.ar>
References: <1382914459-30545-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1382914459-30545-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because of the new fl_open_uri() function since the fltk bump using
fork().

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/alsamixergui/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index acc3cc9..b1b9eb9 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ALSAMIXERGUI
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fltk fork()
 	select BR2_PACKAGE_FLTK
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
-- 
1.8.1.5
