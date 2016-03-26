From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Mar 2016 16:35:10 -0300
Subject: [Buildroot] [PATCH 4/5] webkitgtk24: mark as deprecated
In-Reply-To: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459020911-20593-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's affected by 40+ security bugs, and upstream will only care to fix
the latest stable branch, which is 2.12.x
Some effort was made with the 2.4.10 release to address some security
bugs but it's incomplete.

See:
https://blogs.gnome.org/mcatanzaro/2016/02/01/on-webkit-security-updates/
https://blogs.gnome.org/mcatanzaro/2016/02/19/webkitgtk-gets-security-updates/

Also:
http://webkitgtk.org/security/WSA-2016-0002.html
http://webkitgtk.org/security/WSA-2016-0001.html
http://webkitgtk.org/security/WSA-2015-0002.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webkitgtk24/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
index e95a851..bba3a2b 100644
--- a/package/webkitgtk24/Config.in
+++ b/package/webkitgtk24/Config.in
@@ -16,9 +16,11 @@ comment "webkitgtk24 needs libgtk2 and a toolchain w/ C++, wchar, NPTL, gcc >=4.
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_USE_MMU
+	depends on BR2_DEPRECATED_SINCE_2016_05
 
 config BR2_PACKAGE_WEBKITGTK24
 	bool "webkitgtk 2.4.x"
+	depends on BR2_DEPRECATED_SINCE_2016_05
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.7.3
