From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Tue, 18 Nov 2008 20:52:19 +0100
Subject: [Buildroot] [PATCH] small patches (was: skeleton patch)
In-Reply-To: <e4c675870811181146g39352c46tcaaa832bde6cf4c@mail.gmail.com>
References: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
	<e4c675870811181146g39352c46tcaaa832bde6cf4c@mail.gmail.com>
Message-ID: <e4c675870811181152r49311e69na621b350d2068a3e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 this line is obviously wrong and need a simple change (bug report n.6364):

--- package/lockfile-progs/lockfile-progs.mk	(revision 24038)
+++ package/lockfile-progs/lockfile-progs.mk	(working copy)
@@ -17,7 +17,7 @@

 $(LOCKFILE_PROGS_DIR)/.unpacked: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
 	$(LOCKFILE_PROGS_CAT) $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE) | tar -C
$(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LOCKFILE_PROGS_DIR)
package/lockfile-progs/ *.patch
+	toolchain/patch-kernel.sh $(LOCKFILE_PROGS_DIR)
package/lockfile-progs/ \*.patch
 	touch $(LOCKFILE_PROGS_DIR)/.unpacked

 $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked

 Ciao,
-- 
/roberto
