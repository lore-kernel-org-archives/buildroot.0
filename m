From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jul 2015 19:47:54 +0200
Subject: [Buildroot] [PATCH 06/11] package/libfslparser: remove autoreconf
In-Reply-To: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437414479-16714-6-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autoreconf is not needed anymore with the current
version (4.0.2).

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libfslparser/libfslparser.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 50f0bf6..116a0a2 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -20,7 +20,4 @@ endef
 # The Makefile installs several versions of the libraries, but we only
 # need one of them, depending on the platform.
 
-# without AUTORECONF, configure fails to find install-sh.
-LIBFSLPARSER_AUTORECONF = YES
-
 $(eval $(autotools-package))
-- 
2.4.3
