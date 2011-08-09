From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:40 +0200
Subject: [Buildroot] [PATCH 07/22] sylpheed: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-7-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/sylpheed/sylpheed.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index dbd2408..371341f 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -9,7 +9,7 @@ SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 
-SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix="" \
+SYLPHEED_CONF_OPT = --disable-gtkspell \
                     --includedir=$(STAGING_DIR)/usr/include
 
 SYLPHEED_DEPENDENCIES = host-pkg-config libgtk2
-- 
1.7.2.5
