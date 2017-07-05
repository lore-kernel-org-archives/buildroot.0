From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:46:26 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: remove
	$(HOST_DIR)/usr part from HOST_LDFLAGS
Message-ID: <20170705095035.F063C817B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac4f527d7353fc4f362f029b92d7c90c31be0966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now $(HOST_DIR)/lib and $(HOST_DIR)/usr/lib are the same directory, it
doesn't make sense to pass both to LDFLAGS.

Also use $(HOST_DIR)/lib instead of $(HOST_DIR)/usr/lib for the RPATH.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 291108c..87c8316 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -220,7 +220,7 @@ HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
-HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
+HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 
 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot
