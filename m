From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu,  7 Dec 2006 21:23:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: acpid config
Message-ID: <20061208052308.F0BDF485D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-07 21:23:08 -0800 (Thu, 07 Dec 2006)
New Revision: 16810

Log:
use '/bin/echo -e' to make certain we don't use an unusable /bin/sh builtin


Modified:
   trunk/buildroot/package/acpid/acpid.mk
   trunk/buildroot/package/config/Makefile


Changeset:
Modified: trunk/buildroot/package/acpid/acpid.mk
===================================================================
--- trunk/buildroot/package/acpid/acpid.mk	2006-12-08 05:20:37 UTC (rev 16809)
+++ trunk/buildroot/package/acpid/acpid.mk	2006-12-08 05:23:08 UTC (rev 16810)
@@ -24,7 +24,7 @@
 $(TARGET_DIR)/usr/sbin/acpid: $(ACPID_DIR)/acpid
 	cp -a $(ACPID_DIR)/acpid $(TARGET_DIR)/usr/sbin/acpid
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
-	echo -e "event=button[ /]power\naction=/sbin/poweroff" > $(TARGET_DIR)/etc/acpi/events/powerbtn
+	/bin/echo -e "event=button[ /]power\naction=/sbin/poweroff" > $(TARGET_DIR)/etc/acpi/events/powerbtn
 	touch -c $(TARGET_DIR)/usr/sbin/acpid
 
 acpid: $(TARGET_DIR)/usr/sbin/acpid

Modified: trunk/buildroot/package/config/Makefile
===================================================================
--- trunk/buildroot/package/config/Makefile	2006-12-08 05:20:37 UTC (rev 16809)
+++ trunk/buildroot/package/config/Makefile	2006-12-08 05:23:08 UTC (rev 16810)
@@ -116,7 +116,7 @@
 		$(RM) lxtemp.c a.out; \
 	else \
 		$(RM) lxtemp.c; \
-		echo -e "\007" ;\
+		/bin/echo -e "\007" ;\
 		echo ">> Unable to find the Ncurses libraries." ;\
 		echo ">>" ;\
 		echo ">> You must have Ncurses installed in order" ;\
