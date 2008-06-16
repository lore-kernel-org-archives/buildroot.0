From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 16 Jun 2008 09:54:21 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
In-Reply-To: <20080615204411.C28F33C937@busybox.net>
References: <20080615204411.C28F33C937@busybox.net>
Message-ID: <20080616075421.GB19499@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 15, 2008 at 01:44:11PM -0700, jacmet at uclibc.org wrote:
>Author: jacmet
>Date: 2008-06-15 13:44:10 -0700 (Sun, 15 Jun 2008)
>New Revision: 22360
>
>Log:
>valgrind: don't add pkgconfig files to target
>
>
>Modified:
>   trunk/buildroot/package/valgrind/valgrind.mk
>
>
>Changeset:
>Modified: trunk/buildroot/package/valgrind/valgrind.mk
>===================================================================
>--- trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 20:44:05 UTC (rev 22359)
>+++ trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 20:44:10 UTC (rev 22360)
>@@ -64,6 +64,7 @@
-> 	cp package/valgrind/valgrind.sh $(TARGET_DIR)/usr/bin/valgrind

$(INSTALL)

> 	chmod a+x $(TARGET_DIR)/usr/bin/valgrind
> 	rm -rf $(TARGET_DIR)/usr/share/doc/valgrind
>+	rm -rf $(TARGET_DIR)/usr/lib/pkgconfig

Removing all is a bit generic, no? Think about somebody selecting
pkgconfig for the target. If i would do this, i would expect
$(TARGET_DIR)/usr/lib/pkgconfig to be populated and useable..

> 	#mkdir -p $(TARGET_DIR)/etc/default
> 	#cp $(VALGRIND_DIR)/valgrind.default $(TARGET_DIR)/etc/default/valgrind
> 	#mkdir -p $(TARGET_DIR)/usr/lib/valgrind

cruft. Should have used
$(INSTALL) -D $(VALGRIND_DIR)/valgrind.default $(TARGET_DIR)/etc/default/valgrind
anyway.
