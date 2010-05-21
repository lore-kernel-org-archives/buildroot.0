From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 15:22:14 +0200
Subject: [Buildroot] [PATCH 3/4] Add a show-targets target
In-Reply-To: <cover.1274448102.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274448102.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b7d6c8ad0f786552e21d91d97ad4221ebc43876f.1274448102.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index a4bf4b5..ec2ec36 100644
--- a/Makefile
+++ b/Makefile
@@ -449,6 +449,9 @@ external-deps:
 	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
 		SPIDER=--spider source
 
+show-targets:
+	@echo $(TARGETS)
+
 ifeq ($(BR2_CONFIG_CACHE),y)
 # drop configure cache if configuration is changed
 $(BUILD_DIR)/tgt-config.cache: .config
-- 
1.6.3.3
