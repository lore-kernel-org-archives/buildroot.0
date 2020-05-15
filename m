From: Nicolas Robin <nrosfs@gmail.com>
Date: Fri, 15 May 2020 19:53:56 +0200
Subject: [Buildroot] [PATCH 2/3] arch/x86: adds BR2_X86_CPU_HAS_3DNOW flag
In-Reply-To: <20200515175357.45954-1-nrosfs@gmail.com>
References: <20200515175357.45954-1-nrosfs@gmail.com>
Message-ID: <20200515175357.45954-2-nrosfs@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Robin <nrosfs@gmail.com>
---
 arch/Config.in.x86 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index eb655adbca..7aae3cafb7 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -1,6 +1,8 @@
 # i386/x86_64 cpu features
 config BR2_X86_CPU_HAS_MMX
 	bool
+config BR2_X86_CPU_HAS_3DNOW
+	bool
 config BR2_X86_CPU_HAS_SSE
 	bool
 config BR2_X86_CPU_HAS_SSE2
@@ -155,15 +157,18 @@ config BR2_x86_k6_2
 	bool "k6-2"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_athlon
 	bool "athlon"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_athlon_4
 	bool "athlon-4"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_opteron
 	bool "opteron"
 	select BR2_X86_CPU_HAS_MMX
@@ -209,6 +214,7 @@ config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_c32
 	bool "Via C3-2 (Nehemiah cores)"
 	depends on !BR2_x86_64
-- 
2.24.0
