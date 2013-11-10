From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:55:02 +0100
Subject: [Buildroot] [git commit] hplip: bump to version 3.13.10
Message-ID: <20131111001018.036109A131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b0d870ce57dc92373788fb8cf7dd1add621c6eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sections of the hplip-fix-make.patch patch file were removed, because they
no longer appear in the Makefile.am file.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hplip/hplip-fix-make.patch |   39 ------------------------------------
 package/hplip/hplip.mk             |    2 +-
 2 files changed, 1 insertions(+), 40 deletions(-)

diff --git a/package/hplip/hplip-fix-make.patch b/package/hplip/hplip-fix-make.patch
index b26277d..da05d03 100644
--- a/package/hplip/hplip-fix-make.patch
+++ b/package/hplip/hplip-fix-make.patch
@@ -30,45 +30,6 @@ index 16ea902..b22f46a 100644
  endif
  
  # ui (qt3)
-@@ -564,26 +564,26 @@ endif
- 
- install-dist_hplip_LogDATA:
- if FULL_BUILD
--	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
--	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
--	chmod 775 $(DESTDIR)$(hplip_Logdir)
-+#	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
-+#	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
-+#	chmod 775 $(DESTDIR)$(hplip_Logdir)
- endif	#FULL_BUILD
- if HPLIP_BUILD
--	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
--	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
--	chmod 775 $(DESTDIR)$(hplip_Logdir)
-+#	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
-+#	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
-+#	chmod 775 $(DESTDIR)$(hplip_Logdir)
- endif	#FULL_BUILD
- 
- install-dist_hplip_tmpDATA:
- if FULL_BUILD
--	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
--	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
--	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
-+#	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
-+#	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
-+#	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
- endif	#FULL_BUILD
- if HPLIP_BUILD
--	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
--	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
--	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
-+#	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
-+#	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
-+#	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
- endif	#FULL_BUILD
- 
- install-dist_cronDATA:$(dist_cron_DATA)
 -- 
 1.7.10.4
 
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index b3b798d..704bc4b 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HPLIP_VERSION = 3.13.3
+HPLIP_VERSION = 3.13.10
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg
