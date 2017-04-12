From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:42 +0200
Subject: [Buildroot] [PATCH 08/53] package/Makefile.in: remove
	$(HOST_DIR)/usr part from HOST_LDFLAGS
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-9-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now $(HOST_DIR)/lib and $(HOST_DIR)/usr/lib are the same directory, it
doesn't make sense to pass both to LDFLAGS.

Also use $(HOST_DIR)/lib instead of $(HOST_DIR)/usr/lib for the RPATH.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8a6934a429..579e40b1ba 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -221,7 +221,7 @@ HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
-HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
+HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 
 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot
-- 
2.11.0
