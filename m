From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:46 +0100
Subject: [Buildroot] [PATCH 22/40] flex: install in the staging directory
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3502bb056f0de1e4eecd7b0de6156daf18a2162c.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Flex contains a libfl.a directory, which programs for the target might
link against. Therefore, we need to install flex to the staging
directory. An example of such a program is gob2, which needs the
yywrap() function, which is implemented by libfl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flex/flex.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index fed0d77..43e7d57 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -9,6 +9,7 @@ FLEX_SOURCE:=flex_$(FLEX_VERSION).orig.tar.gz
 FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
 FLEX_DIR:=$(BUILD_DIR)/flex-$(FLEX_VERSION)
+FLEX_INSTALL_STAGING=YES
 
 # lex -> flex
 define FLEX_INSTALL_LEX
-- 
1.6.3.3
