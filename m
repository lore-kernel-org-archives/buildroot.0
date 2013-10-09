From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 16:49:36 -0300
Subject: [Buildroot] [PATCH 4/5] netatalk: needs mmu
In-Reply-To: <1381348177-2189-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381348177-2189-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381348177-2189-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netatalk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 5c676e9..9bf0515 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETATALK
 	bool "netatalk"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBEVENT
-- 
1.8.1.5
