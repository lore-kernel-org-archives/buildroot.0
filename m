From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Dec 2016 10:43:04 +0100
Subject: [Buildroot] [PATCH 1/3] core: add a kconfig option to require an
	UTF8 locale on the host
In-Reply-To: <cover.1480844552.git.yann.morin.1998@free.fr>
References: <cover.1480844552.git.yann.morin.1998@free.fr>
Message-ID: <8fd6b8f426ac7fbde5e2db5f3e44b4a7df107a42.1480844552.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This can be selected when we need the host to have an UTF-8 locale
(e.g. to build uClibc with support for locales).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 98096df..495b71c 100644
--- a/Config.in
+++ b/Config.in
@@ -84,6 +84,11 @@ config BR2_HOSTARCH_NEEDS_IA32_LIBS
 config BR2_HOSTARCH_NEEDS_IA32_COMPILER
 	bool
 
+# Hidden boolean selected by packages that need the host to have an
+# UTF8 locale.
+config BR2_NEEDS_HOST_UTF8_LOCALE
+	bool
+
 source "arch/Config.in"
 
 menu "Build options"
-- 
2.7.4
