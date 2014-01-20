From: =?UTF-8?q?Adrien=20B=C3=A9raud?= <adrien.beraud@savoirfairelinux.com>
Date: Mon, 20 Jan 2014 12:35:17 -0500
Subject: [Buildroot] [PATCH] arch: use BR2_X86_CPU_HAS_SSE4,
	SSE42 with jaguar
Message-ID: <1390239317-24409-1-git-send-email-adrien.beraud@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This follow-up commit adds support for SSE 4 and SSE 4.2 to
the jaguar architecture.

Signed-off-by: Adrien B?raud <adrien.beraud@savoirfairelinux.com>
---
 arch/Config.in.x86 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index bbedfb4..8f6a527 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -131,6 +131,8 @@ config BR2_x86_jaguar
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_geode
 	bool "geode"
 	# Don't include MMX support because there several variant of geode
-- 
1.8.5.3
