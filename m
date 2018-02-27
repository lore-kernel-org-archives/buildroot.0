From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:24 -0600
Subject: [Buildroot] [NEXT 09/26] bzip2: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-10-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/bzip2/bzip2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index e435330..c81f587 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -10,6 +10,8 @@ BZIP2_INSTALL_STAGING = YES
 BZIP2_LICENSE = bzip2 license
 BZIP2_LICENSE_FILES = LICENSE
 
+BZIP2_CPE_ID=bzip:$(BZIP2_NAME):$(BZIP2_VERSION)
+
 ifeq ($(BR2_STATIC_LIBS),)
 define BZIP2_BUILD_SHARED_CMDS
 	$(TARGET_MAKE_ENV) \
-- 
1.9.1
