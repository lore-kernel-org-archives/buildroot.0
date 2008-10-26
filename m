From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 02:14:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/docker
Message-ID: <20081026091410.C9A79F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-26 02:14:10 -0700 (Sun, 26 Oct 2008)
New Revision: 23797

Log:
docker: strip on target install

Modified:
   trunk/buildroot/package/docker/docker.mk


Changeset:
Modified: trunk/buildroot/package/docker/docker.mk
===================================================================
--- trunk/buildroot/package/docker/docker.mk	2008-10-26 09:14:06 UTC (rev 23796)
+++ trunk/buildroot/package/docker/docker.mk	2008-10-26 09:14:10 UTC (rev 23797)
@@ -23,3 +23,6 @@
 
 $(eval $(call AUTOTARGETS,package,docker))
 
+$(DOCKER_HOOK_POST_INSTALL): $(DOCKER_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/docker
+	touch $@
