From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:57 +0200
Subject: [Buildroot] [PATCH 71/74] tcpdump: remove useless stripping
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <19f9348bec29779c365645d00c33cc76b83a72b3.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcpdump/tcpdump.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 183df94..0b9236d 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -17,8 +17,3 @@ TCPDUMP_CONF_OPT:=--without-crypto \
 TCPDUMP_DEPENDENCIES:=zlib libpcap
 
 $(eval $(call AUTOTARGETS,package,tcpdump))
-
-$(TCPDUMP_HOOK_POST_INSTALL): $(TCPDUMP_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/tcpdump
-	touch $@
-
-- 
1.7.0.4
