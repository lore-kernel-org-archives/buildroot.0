From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:10:55 +0200
Subject: [Buildroot] [git commit] dhcpdump: add $(TARGET_MAKE_ENV) before
	$(MAKE)
Message-ID: <20151021201123.3E3DB7FD82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6604119823b4f59b60b87de2b62621f673eede96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consistency reasons with other packages, let's pass
$(TARGET_MAKE_ENV) in the environment when calling $(MAKE).

[Thomas: improved commit log.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpdump/dhcpdump.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 6b677a6..3584f4f 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -16,8 +16,8 @@ DHCPDUMP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 
 define DHCPDUMP_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS) -D_GNU_SOURCE" \
-		LIBS="$(DHCPDUMP_LIBS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS) \
+		-D_GNU_SOURCE" LIBS="$(DHCPDUMP_LIBS)"
 endef
 
 define DHCPDUMP_INSTALL_TARGET_CMDS
