From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 26 Jun 2007 09:58:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070626165812.7D40AA4598@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-26 09:58:11 -0700 (Tue, 26 Jun 2007)
New Revision: 18946

Log:
- fix typo in sed expr


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-06-26 16:36:31 UTC (rev 18945)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-06-26 16:58:11 UTC (rev 18946)
@@ -143,19 +143,19 @@
 	echo "# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set" >> $(UCLIBC_DIR)/.config
 endif
 ifeq ($(BR2_INET_IPV6),y)
-	$(SED) 's.^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,g' $(UCLIBC_DIR)/.config
 else
-	$(SED) 's.^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.config
 endif
 ifeq ($(BR2_INET_RPC),y)
-	$(SED) 's.^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=y,g' \
-		-e 's.^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=y,g' \
-		-e 's.^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=y,g'
+	$(SED) 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=y,g' \
+		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=y,g' \
+		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=y,g' \
 		$(UCLIBC_DIR)/.config
 else
-	$(SED) 's.^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=n,g' \
-		-e 's.^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=n,g' \
-		-e 's.^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=n,g'
+	$(SED) 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=n,g' \
+		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=n,g' \
+		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=n,g' \
 		$(UCLIBC_DIR)/.config
 endif
 ifeq ($(BR2_SOFT_FLOAT),y)
