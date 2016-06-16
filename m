From: Julien Floret <julien.floret@6wind.com>
Date: Thu, 16 Jun 2016 16:41:15 +0200
Subject: [Buildroot] [PATCH 3/3] sstrip: mark as deprecated
In-Reply-To: <1466088075-7635-1-git-send-email-julien.floret@6wind.com>
References: <1466088075-7635-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1466088075-7635-4-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sstrip is unmaintained and potentially harmful, as Yann explained in
commit 6a6962fd82ca ("build/sstrip: deprecate for 2014.05").

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/sstrip/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sstrip/Config.in b/package/sstrip/Config.in
index 12a5941c54aa..c458f8eab1b0 100644
--- a/package/sstrip/Config.in
+++ b/package/sstrip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SSTRIP
 	bool "sstrip"
+	depends on BR2_DEPRECATED_SINCE_2016_08
 	help
 	  Small utility that removes a few bytes from an executable that
 	  strip leaves behind.
-- 
2.1.0
