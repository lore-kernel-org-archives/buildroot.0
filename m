From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:01 +0200
Subject: [Buildroot] [PATCH v4 02/22] gettext: warn that legal-info is not
	implemented
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/gettext/gettext.mk |    3 +++
 1 file changed, 3 insertions(+)

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
-- 
1.7.9.5
