From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Oct 2019 19:04:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/clamav: fix clamsubmit linking
In-Reply-To: <20191012170455.9816-1-fontaine.fabrice@gmail.com>
References: <20191012170455.9816-1-fontaine.fabrice@gmail.com>
Message-ID: <20191012170455.9816-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/49973b2283c65de5155deaf633cd6569a37af375

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-using-wrong-linker-for-clamsubmit.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/clamav/0003-Fix-using-wrong-linker-for-clamsubmit.patch

diff --git a/package/clamav/0003-Fix-using-wrong-linker-for-clamsubmit.patch b/package/clamav/0003-Fix-using-wrong-linker-for-clamsubmit.patch
new file mode 100644
index 0000000000..f7d72c000f
--- /dev/null
+++ b/package/clamav/0003-Fix-using-wrong-linker-for-clamsubmit.patch
@@ -0,0 +1,27 @@
+From 59f7ec0046e399e33003f83dd76f968441066ed4 Mon Sep 17 00:00:00 2001
+From: arlecchino <kolbma@users.noreply.github.com>
+Date: Mon, 9 Sep 2019 14:58:54 +0200
+Subject: [PATCH] Fix using wrong linker for clamsubmit
+
+Changing from Objective-C linker to C linker for clamsubmit
+
+[Retrieved from:
+https://github.com/Cisco-Talos/clamav-devel/pull/108/commits/59f7ec0046e399e33003f83dd76f968441066ed4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ clamsubmit/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/clamsubmit/Makefile.in b/clamsubmit/Makefile.in
+index 1ada5c620c..142f0f0291 100644
+--- a/clamsubmit/Makefile.in
++++ b/clamsubmit/Makefile.in
+@@ -679,7 +679,7 @@ installcheck-binPROGRAMS: $(bin_PROGRAMS)
+ 
+ clamsubmit$(EXEEXT): $(clamsubmit_OBJECTS) $(clamsubmit_DEPENDENCIES) $(EXTRA_clamsubmit_DEPENDENCIES) 
+ 	@rm -f clamsubmit$(EXEEXT)
+-	$(AM_V_OBJCLD)$(OBJCLINK) $(clamsubmit_OBJECTS) $(clamsubmit_LDADD) $(LIBS)
++	$(AM_V_CCLD)$(LINK) $(clamsubmit_OBJECTS) $(clamsubmit_LDADD) $(LIBS)
+ 
+ mostlyclean-compile:
+ 	-rm -f *.$(OBJEXT)
-- 
2.23.0
