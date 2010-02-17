From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2010 11:10:23 +0100
Subject: [Buildroot] [git commit master] Create $(STAGING_DIR)/usr/bin
	unconditionnally
Message-ID: <20100217101056.0179C7770C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a05c337de5d86f9494fdc6a950e5121256de6ba3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
