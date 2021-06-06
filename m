From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Jun 2021 19:38:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/mimic: fix static build with gcc 10
Message-ID: <20210606173804.38810-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bee20bbfa4fa64ed8704bfb9586d5a3148f39fdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-Fix-linking-on-gcc-10.2.0-or-newer.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch

diff --git a/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch b/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch
new file mode 100644
index 0000000000..ea02bf587e
--- /dev/null
+++ b/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch
@@ -0,0 +1,27 @@
+From 77b36eaeb2c38eba571b8db7e9bb0fd507774e6d Mon Sep 17 00:00:00 2001
+From: Kris Gesling <kris.gesling@mycroft.ai>
+Date: Tue, 11 May 2021 09:15:22 +0930
+Subject: [PATCH] Fix linking on gcc 10.2.0 or newer
+
+Co-authored-by: MichaelSabal <michaelsabal@users.noreply.github.com>
+
+[Retrieved from:
+https://github.com/MycroftAI/mimic1/commit/77b36eaeb2c38eba571b8db7e9bb0fd507774e6d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lang/cmu_indic_lang/cmu_indic_lang.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lang/cmu_indic_lang/cmu_indic_lang.h b/lang/cmu_indic_lang/cmu_indic_lang.h
+index 75ee46c..83e2afa 100644
+--- a/lang/cmu_indic_lang/cmu_indic_lang.h
++++ b/lang/cmu_indic_lang/cmu_indic_lang.h
+@@ -51,7 +51,7 @@ void cmu_indic_lang_init(cst_voice *v);
+ extern const cst_phoneset cmu_indic_phoneset;
+ extern const cst_cart cmu_indic_phrasing_cart; 
+ 
+-const cst_regex * const cst_rx_not_indic;
++extern const cst_regex * const cst_rx_not_indic;
+ 
+ #ifdef __cplusplus
+ } /* extern "C" */
-- 
2.30.2
