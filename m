From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Feb 2010 00:46:06 +0100
Subject: [Buildroot] [PATCH 1/3] Create $(STAGING_DIR)/usr/bin
	unconditionnally
In-Reply-To: <cover.1265759162.git.thomas.petazzoni@free-electrons.com>
References: <cover.1265759162.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a05c337de5d86f9494fdc6a950e5121256de6ba3.1265759162.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the build of libcap, with external toolchain, when it is
the first package being built.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index a0c18ba..76eeddb 100644
--- a/Makefile
+++ b/Makefile
@@ -371,6 +371,7 @@ ifneq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 endif
 endif
 	@mkdir -p $(STAGING_DIR)/usr/include
+	@mkdir -p $(STAGING_DIR)/usr/bin
 
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-- 
1.6.3.3
