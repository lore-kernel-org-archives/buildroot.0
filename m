From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 19 Oct 2008 00:44:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/acpid
Message-ID: <20081019074430.EAD7C3C803@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-19 00:44:30 -0700 (Sun, 19 Oct 2008)
New Revision: 23718

Log:
acpid: use $(MAKE) in acpid-clean instead of hardcoding make

Modified:
   trunk/buildroot/package/acpid/acpid.mk


Changeset:
Modified: trunk/buildroot/package/acpid/acpid.mk
===================================================================
--- trunk/buildroot/package/acpid/acpid.mk	2008-10-19 07:44:25 UTC (rev 23717)
+++ trunk/buildroot/package/acpid/acpid.mk	2008-10-19 07:44:30 UTC (rev 23718)
@@ -33,7 +33,7 @@
 acpid-source: $(DL_DIR)/$(ACPID_SOURCE)
 
 acpid-clean:
-	-make -C $(ACPID_DIR) clean
+	-$(MAKE) -C $(ACPID_DIR) clean
 
 acpid-dirclean:
 	rm -rf $(ACPID_DIR)
