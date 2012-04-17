From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Tue, 17 Apr 2012 17:05:40 +0200
Subject: [Buildroot] [PATCH 2/2] sam-ba: only propose it if the host is x86
	or x86_64
In-Reply-To: <1334675140-20303-1-git-send-email-plagnioj@jcrosoft.com>
References: <1334675140-20303-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <1334675140-20303-2-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As sam-ba is deliver as a binary for x86

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 package/sam-ba/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index f2ea01f..20b2b36 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_SAM_BA
 	bool "host sam-ba"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
 	  Atmel SAM-BA software provides an open set of tools for
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
-- 
1.7.9.1
