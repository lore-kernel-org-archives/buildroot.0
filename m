From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Nov 2015 00:18:37 +0100
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: remove HOSTCC_VERSION
Message-ID: <1448147919-5463-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HOSTCC_VERSION is no longer used since gcc switched to the package
infrastructure in e236fe481. It was in fact no longer needed since we
dropped support for gcc 4.3.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note that we currently claim to support system gcc >= 2.95, but I don't
think that matches reality...
---
 package/Makefile.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 85008bb..82a66c2 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -219,10 +219,6 @@ HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
 
-# hostcc version as an integer - E.G. 4.3.2 => 432
-HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
-	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
-
 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot
 # might get installed into $(HOST_DIR)/usr/bin and therefore appears
-- 
2.6.2
