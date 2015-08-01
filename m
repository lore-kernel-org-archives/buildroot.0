From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  1 Aug 2015 18:55:17 +0200
Subject: [Buildroot] [PATCH 2/3] package/eflutils: needs argp-standalone
	with musl toolchains
In-Reply-To: <1438448118-26198-1-git-send-email-romain.naour@openwide.fr>
References: <1438448118-26198-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438448118-26198-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/elfutils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 6c6856e..ea0ae62 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -4,7 +4,7 @@ comment "elfutils needs a toolchain w/ wchar, dynamic library"
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
-- 
2.4.3
