From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 12 Nov 2012 21:08:31 +0100
Subject: [Buildroot] [PATCH for-2012.11 4/5] legacy: evtest is dropped from
	input-tools package
In-Reply-To: <1352750912-16012-1-git-send-email-arnout@mind.be>
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
Message-ID: <1352750912-16012-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

We select BR2_PACKAGE_EVTEST automatically. This has only limited use:
when the LEGACY_CHECK menu is disabled in menuconfig (or even oldconfig),
it will also unselect BR2_PACKAGE_EVTEST again. Still, it can serve as a
hint of how to fix things.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4bc8784..04ccb92 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -48,4 +48,11 @@ if BR2_LEGACY_CHECK_2012_11
 # Legacy options from 2012.08
 #
 
+config BR2_PACKAGE_INPUT_TOOLS_EVTEST
+	bool "input-tools evtest is now a separate package evtest"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EVTEST
+	help
+	  The evtest program from input-tools is now a separate package.
+
 endif
-- 
1.7.10.4
