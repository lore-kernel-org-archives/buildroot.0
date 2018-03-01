From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 28 Feb 2018 23:23:39 -0600
Subject: [Buildroot] [next,v2 8/8] boa: add CPE id
In-Reply-To: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519881819-51445-9-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Thomas P
 - Updated how the ID is generated.
 - Added back in newline before the *_INSTALL_TARGET_CMD
---
 package/boa/boa.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index d8bcaa1..2141fb2 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -8,6 +8,7 @@ BOA_VERSION = 0.94.14rc21
 BOA_SITE = http://www.boa.org
 BOA_LICENSE = GPL-2.0+
 BOA_LICENSE_FILES = COPYING
+BOA_CPE_ID_VENDOR = $(BOE_NAME)
 
 define BOA_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/src/boa $(TARGET_DIR)/usr/sbin/boa
-- 
1.9.1
