From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 14 Jul 2014 08:41:02 +0200
Subject: [Buildroot] [PATCH] nasm: remove unused target package
Message-ID: <1405320062-21455-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When nasm was added in da8d09b716, it got both the host and the target
variants even though it doesn't have a Config.in and the target variant isn't
used anywhere. Therefore, this patch removes the unused target variant.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nasm/nasm.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index b9077eb..b87d6ef 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -10,5 +10,4 @@ NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2c
 NASM_LICENSE_FILES = LICENSE
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.0.1
