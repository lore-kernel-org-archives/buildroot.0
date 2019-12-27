From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 27 Dec 2019 22:54:29 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/alsamixergui: fix build with latest alsa-lib
Message-ID: <20191227215429.2326216-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

alsa-lib created a separated libatopology library since version 1.2.1:
https://github.com/alsa-project/alsa-lib/commit/75d393a563efb578c79364a277087c6326267f52

However, atopology is not correctly detected when cross-compiling so
pass ac_cv_lib_atopology_snd_tplg_new=yes

Fixes:
 - http://autobuild.buildroot.org/results/564c1561e83e0c064f3859d25e68dec96640e060

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Set ac_cv_lib_atopology_snd_tplg_new=yes instead of 
 --disable-alsatest --enable-alsa-topology

 package/alsamixergui/alsamixergui.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index 24e2497f3b..c8e9ce4f73 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -14,7 +14,8 @@ ALSAMIXERGUI_AUTORECONF = YES
 ALSAMIXERGUI_CONF_ENV = \
 	ac_cv_lib_fltk_numericsort=yes \
 	ac_cv_lib_fltk_fl_numericsort=yes \
-	ac_cv_lib_asound_snd_ctl_open=yes
+	ac_cv_lib_asound_snd_ctl_open=yes \
+	ac_cv_lib_atopology_snd_tplg_new=yes
 
 ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
 
-- 
2.24.0
