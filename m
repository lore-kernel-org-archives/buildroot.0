From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Mon, 21 May 2018 10:53:08 -0700
Subject: [Buildroot] [PATCH v2 3/5] package/c-ares: enable the host variant
 for a c-ares install
In-Reply-To: <20180521175310.18563-1-charles.hardin@storagecraft.com>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
Message-ID: <20180521175310.18563-4-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

gRPC needs a c-ares library for the plugins to compile against,
and it isn't something that can be easily patched out. So,
allow c-ares to be compiled as a host tool.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/c-ares/c-ares.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 67254244a1..76e9687b37 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -15,3 +15,4 @@ C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = ares_mkquery.c
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.15.1 (Apple Git-101)
