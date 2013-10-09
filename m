From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 18:30:45 -0300
Subject: [Buildroot] [PATCH 7/8] transmission: needs mmu
In-Reply-To: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381354246-29140-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/transmission/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 9284075..30314f7 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
-- 
1.8.1.5
