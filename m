From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:05 +0100
Subject: [Buildroot] [RFC v2 05/31] gettext: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/gettext/gettext.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index f4c8c76..b5a2099 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -113,6 +113,10 @@ $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY): $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 		autopoint envsubst gettext.sh gettextize msg* ?gettext)
 	touch -c $@
 
+gettext-legal-info:
+	@echo WARNING: Cannot produce any legal info for package gettext \
+		>>$(LEGAL_WARNINGS)
+
 gettext: host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
-- 
1.7.5.4
