From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 02:56:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ipsec-tools
Message-ID: <20070923095622.B34E530075@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 02:56:21 -0700 (Sun, 23 Sep 2007)
New Revision: 19959

Log:
Fix syntax error when using addprefix in ipsec-tools.mk

Modified:
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk


Changeset:
Modified: trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-09-23 09:55:17 UTC (rev 19958)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-09-23 09:56:21 UTC (rev 19959)
@@ -112,14 +112,14 @@
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOON) \
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL)
 ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -f $(addprefix $(TARGET_DIR)/usr/man/,
+	rm -f $(addprefix $(TARGET_DIR)/usr/man/, \
 		man3/ipsec_strerror.3 man3/ipsec_set_policy.3 \
 		man5/racoon.conf.5 \
 		man8/racoonctl.8 man8/racoon.8 \
 		man8/plainrsa-gen.8 man8/setkey.8)
 endif
 ifeq ($(strip $(BR2_PACKAGE_IPSEC_TOOLS_LIBS)), y)
-	install -D $(addprefix $(IPSEC_TOOLS_DIR)/src/,
+	install -D $(addprefix $(IPSEC_TOOLS_DIR)/src/, \
 		libipsec/.libs/libipsec.a libipsec/.libs/libipsec.la \
 		racoon/.libs/libracoon.a racoon/.libs/libracoon.la) \
 		$(STAGING_DIR)/lib
