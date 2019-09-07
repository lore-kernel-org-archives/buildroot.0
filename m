From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  7 Sep 2019 11:40:26 +0200
Subject: [Buildroot] [PATCH v2 11/12] toolchain: add a warning when Clang is
 used as cross-compiler
In-Reply-To: <20190907094027.9537-1-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
Message-ID: <20190907094027.9537-12-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bd2c547ff1..570f029cac 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -37,6 +37,12 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_UCONTEXT
 	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS
 
+if BR2_USER_HOST_CLANG_AS_CROSS_COMPILER
+comment "-------------------------------------------------------"
+comment "Clang will be used as C/C++ cross-compiler !           "
+comment "-------------------------------------------------------"
+endif
+
 choice
 	prompt "Toolchain type"
 	help
-- 
2.21.0
