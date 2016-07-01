From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:17 +0200
Subject: [Buildroot] [PATCH v2 12/15] toolchain/toolchain-external: add knob
	for fortran support
In-Reply-To: <20160701162920.19632-1-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
Message-ID: <20160701162920.19632-13-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
changes v1->v2:
- none
---
 toolchain/toolchain-external/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 552536e..253aeb1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1020,6 +1020,18 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
+	bool "Toolchain has Fortran support?"
+	depends on BR2_USE_WCHAR # libquadmath
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Select this option if your external toolchain has fortran
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
+comment "Fortran support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 	string "Extra toolchain libraries to be copied to target"
 	help
-- 
2.9.0
