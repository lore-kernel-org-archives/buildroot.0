From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 11 Aug 2017 18:00:48 +0200
Subject: [Buildroot] [PATCH 2/3] package/jq: install to staging
In-Reply-To: <1502467249-2861-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1502467249-2861-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1502467249-2861-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install the libraries to staging to be usable by other packages.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/jq/jq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 9a094ba..aecdba2 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -8,6 +8,7 @@ JQ_VERSION = 1.5
 JQ_SITE = https://github.com/stedolan/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
+JQ_INSTALL_STAGING = YES
 
 # uses c99 specific features
 JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
-- 
2.7.4
