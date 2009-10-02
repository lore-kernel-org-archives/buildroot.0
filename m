From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 10:24:54 +0200
Subject: [Buildroot] [git commit master] dnsmasq: remove unneeded post
	install hook
Message-ID: <20091002082527.DDB5777756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b61765444467cb69c4c5612ee1d7f880481d847
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Makefile.autotools.in already cleans up man pages if configured to do so.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/dnsmasq.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index a7e43dc..dec2971 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -48,11 +48,6 @@ else
 endif
 	touch $@
 
-$(DNSMASQ_HOOK_POST_INSTALL):
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -f $(TARGET_DIR)/usr/share/man/man8/dnsmasq.8
-endif
-
 $(DNSMASQ_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
 	rm -f $(TARGET_DIR)/usr/sbin/dnsmasq
-- 
1.6.3.3
