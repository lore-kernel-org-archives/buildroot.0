From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:06:15 +0200
Subject: [Buildroot] [git commit] gettext: warn that legal-info is not
	implemented
Message-ID: <20120717173300.1013296A87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16bc6efeab3ccc44d9cfaaab4cbbd37e323952ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index f3605da..9778007 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -113,6 +113,9 @@ $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY): $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 		autopoint envsubst gettext.sh gettextize msg* ?gettext)
 	touch -c $@
 
+gettext-legal-info:
+	@$(call legal-warning-pkg,gettext,legal-info not yet implemented)
+
 gettext: host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
