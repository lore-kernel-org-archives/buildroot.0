From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 09:41:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntp
Message-ID: <20070728164144.E41D0A493C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 09:41:44 -0700 (Sat, 28 Jul 2007)
New Revision: 19297

Log:
Update config's of ntp

Modified:
   trunk/buildroot/package/ntp/ntp.mk


Changeset:
Modified: trunk/buildroot/package/ntp/ntp.mk
===================================================================
--- trunk/buildroot/package/ntp/ntp.mk	2007-07-28 16:39:06 UTC (rev 19296)
+++ trunk/buildroot/package/ntp/ntp.mk	2007-07-28 16:41:44 UTC (rev 19297)
@@ -24,6 +24,8 @@
 	$(SED) '/[[:space:](]index[[:space:]]*(/s/[[:space:]]*index[[:space:]]*(/ strchr(/g' $(NTP_DIR)/libisc/*.c $(NTP_DIR)/arlib/sample.c
 	$(SED) '/[[:space:](]rindex[[:space:]]*(/s/[[:space:]]*rindex[[:space:]]*(/ strrchr(/g' $(NTP_DIR)/ntpd/*.c
 	#$(SED) 's/\(^#[[:space:]]*include[[:space:]]*<sys\/var.h>\)/\/\/ \1/' $(NTP_DIR)/util/tickadj.c
+	$(CONFIG_UPDATE) $(NTP_DIR)
+	$(CONFIG_UPDATE) $(NTP_DIR)/sntp
 	touch $@
 
 $(NTP_DIR)/.configured: $(NTP_DIR)/.patched
