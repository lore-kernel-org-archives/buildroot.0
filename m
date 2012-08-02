From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:54:47 -0000
Subject: [Buildroot] [git commit branch/next] newt: warn that legal-info is
	not implemented
Message-ID: <20120802195251.3969E8F944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75672c122c20a2c041bb50650227b43fefa4e2ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/newt/newt.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index ac450e0..b10e4f8 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -58,6 +58,9 @@ $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION): $(STAGING_DIR)/usr/lib/libnewt
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnewt.so*
 	touch -c $@
 
+newt-legal-info:
+	@$(call legal-warning-pkg,newt,legal-info not yet implemented)
+
 newt: slang $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION)
 
 newt-source: $(DL_DIR)/$(NEWT_SOURCE)
