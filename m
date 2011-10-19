From: Damian Kaczmarek <damian@veritymedical.co.uk>
Date: Wed, 19 Oct 2011 22:55:45 +0200
Subject: [Buildroot] [PATCH] -lsof was unable to patch Makefile.skel due to
	bad file permissions. Adding chmod solves it. (openSUSE)
Message-ID: <1319057745-31257-1-git-send-email-damian@veritymedical.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Damian Kaczmarek <damian@veritymedical.co.uk>
---
 package/lsof/lsof.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index ff76f92..bfdfee3 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -35,6 +35,7 @@ endif
 # The .tar.bz2 contains another .tar, which contains the source code.
 define LSOF_EXTRACT_TAR
 	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -xf $(@D)/lsof_$(LSOF_VERSION)_src.tar -C $(@D)
+	chmod +w -R $(@D)
 	rm -f $(@D)/lsof_$(LSOF_VERSION)_src.tar
 endef
 
-- 
1.7.3.4
