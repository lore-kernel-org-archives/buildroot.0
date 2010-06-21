From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] package/config: create .depend
	in object directory
Message-ID: <20100621210811.D9437817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a4c99e8fb068686e8d81fa0b33bf088651f3805f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/Makefile |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/config/Makefile b/package/config/Makefile
index 34cc4b7..f0a030f 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -5,9 +5,9 @@ srctree := .
 
 include Makefile.kconfig
 #HOSTCFLAGS+=-Dinline="" -include foo.h
--include .depend
-.depend: $(wildcard *.h *.c)
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) -MM *.c > .depend 2>/dev/null || :
+-include $(obj)/.depend
+$(obj)/.depend: $(wildcard *.h *.c)
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) -MM *.c > $@ 2>/dev/null || :
 
 __hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
 host-csingle := $(foreach m,$(__hostprogs),$(if $($(m)-objs),,$(m)))
-- 
1.7.1
