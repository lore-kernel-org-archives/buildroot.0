From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed,  9 May 2018 17:51:46 +0200
Subject: [Buildroot] [PATCH 2/2] package/libmediaart: Fix default symbol for
 media art backend
In-Reply-To: <20180509155146.25410-1-petr.vorel@gmail.com>
References: <20180509155146.25410-1-petr.vorel@gmail.com>
Message-ID: <20180509155146.25410-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Symbol BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE does not exist it was meant
to be BR2_PACKAGE_MEDIAART_BACKEND_NONE.

Fixes: c443830a57 libmediaart: new package

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Error found while working with updated kconfig, which offers this
feature.
---
 package/libmediaart/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmediaart/Config.in b/package/libmediaart/Config.in
index e5e770d4fc..d3fea05ac4 100644
--- a/package/libmediaart/Config.in
+++ b/package/libmediaart/Config.in
@@ -18,7 +18,7 @@ if BR2_PACKAGE_LIBMEDIAART
 
 choice
 	prompt "media art backend"
-	default BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
+	default BR2_PACKAGE_MEDIAART_BACKEND_NONE
 
 config BR2_PACKAGE_MEDIAART_BACKEND_NONE
 	bool "none"
-- 
2.16.3
